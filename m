Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795686702;
	b=Ws0njZ67Y8VxPckbz8+2IFl3Je6R7e0IUbTP2C08+St3+88ABUgOoon4Fl01PFO5U3xq
	 mBs+nB2oXc9IlSb2wODBtZubD0pwL9MPY7dyhamTMWrahynoEs2zNdm+p9MIrVDXsxvTx
	 jvsBQUmFM9OG93bqEelDesSeYkvaR0hmF7Fuhog5Gc+69zDb8zPYxpNsK+UALWUHWIwk6
	 rCHz7LuVb51yEH2Qe7O2OwwrORVETUWp1RJXlizGiJm+xB6IQWuGM058S+Yfr7WjYg1X/
	 ZKFSCVb/G8oUqpGXHsWi8D6O/wqfQbAs/B21Ayk7NPp5KpU5Hgl4fpxApdFQsa4dioA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795686702;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=b2b0R37N0cNDG6LwdnW9AOEOCqhnsuMIntkJk3OiCVk=;
	b=ACQu0ExWy3L45p2gF4rCDPSU1baeq2qGQIqRbKVnkaC4RG0uf/6ljRWvmRg4w1Z6TxgY
	 ECoJVGrU/NaGHfcWLpwvcx0r/Tg7A2l7shYVcBI2066zoTW0ZDPjA5DPYp9uk6V5abXS0
	 xKukAE0/Z09zrQ8O2JvWF8ml4fBbqCwWUec++N7Ndlj/VTW4u+13kjBlV6sK8dcGsn7qZ
	 R2iD4MtXqNS4xlm0Rlc1Mcx/5xynsSGXCYxalxhfsYT9SPsG8IO6PML6yb9QoS40kUw4O
	 Q+9vTf6rmhVpGrQ0+gJlzyrsdtfrIFgQxkJwyEGlBKpQmoqYLeh1zFD+QRg3e/ezk6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NglhJyuj;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=eSf5YhDs;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92258606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:51:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92258606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NglhJyuj;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=eSf5YhDs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795686700;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b2b0R37N0cNDG6LwdnW9AOEOCqhnsuMIntkJk3OiCVk=;
	b=NglhJyujZidG1wh9KnE18o4xefEtv14FMcA8ak08V8XoQBmG1b/fEVGJVd93CrD2oKQcEL
	BfK9jY60wQ/5xihueEr7sr0WBEX6qLW+zwl6kFe7MB78aGE4j3q+XqVaOHzFE/VuEvQPPk
	1W1N1J9zC+JGOaMEj4ahFxjpNHuJLP4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-620-CVWBCjc8NYu-OfwgDoCzVQ-1; Thu, 26 Nov 2026 09:51:38 +0000
X-MC-Unique: CVWBCjc8NYu-OfwgDoCzVQ-1
X-Mimecast-MFC-AGG-ID: CVWBCjc8NYu-OfwgDoCzVQ_1795686697
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-48e4d1e29f3so5617921f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 01:51:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795686697; x=1796291497; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b2b0R37N0cNDG6LwdnW9AOEOCqhnsuMIntkJk3OiCVk=;
        b=eSf5YhDs7s4d/I+PuOqPG7GnNpSXVv5YHZf2MTaDiGSvROudWXnjtlOkgjVsqw+WpP
         lTDSssv14eAoLBy0bl1Ci2jfbWBegKn7XEOaliLTA5vt1Z6j1pZiFCA0AAj3hDDltBos
         6C3+AdPdLxVsXx8Xv/cyIHWJ4ltIx7vVQKZE/K8Nue9lFYlJMLTfgqalzC2E/rzpZQPA
         O1mCoK87jRv6TIUQaOmHgKqRFIOu4HKDLbFnkUfgPdOLYDcP41qbWWBllhlVS+lVs3lb
         QH0d9NXFvc+ZBTENAKxP/WwA5UuA0jDFKl8yuoT0dYbrNJ8LouJ070V2AyeDNGcZVAq1
         XW/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795686697; x=1796291497;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b2b0R37N0cNDG6LwdnW9AOEOCqhnsuMIntkJk3OiCVk=;
        b=SjyeV7CMZQuMII7tAr7UrmkYnwVPOcKyUqo4HOQluns5GlrzVNknZMW/Q710D0Lb1b
         W01eRQ2sE1ouZv3n3Lyn98Od39FX19fwNM22Ih8GxjXV0Qi/S7nPqr9DFDp85SZidKII
         awMEEBtkoM+9pz43w/79nmYLU/Yp1rmvlZ+gEtsOHB6m5u9p0RTNkm3sS7as04Meidaf
         eFvMJqqr8DTC/gO/vJ+tqu8kMFxe2d2CauZZKOLwWkCkXnavvfSvsPqfIGMZvuAJAXc/
         Fmmp21R3kOjXsGrSKAPKt37uCvapmAJnjOw4S3qTEJE9S6nDAOsSj32NNE9ZQlYAJr1U
         YE/w==
X-Forwarded-Encrypted: i=1; AL+hErEOoYnrQNUl3FRBIOFbsz0zWfC0cV1WfV6oYCDdVTHCmojXBCRv0rHXBbiXJ9s/2M7SmdRLpdonbVBYaho=@vger.kernel.org
X-Gm-Message-State: APuU4Z9bo8MpwSk2dqUJSKrQ7DATrBKTvai83vAXOYHjC3eXdOZsUP2V
	h1fCl/rbFGqO4xLS/DDVpGxL945vQHZDa1tnpaeF2CvOnNu1HRKxIo0OC/y1eW3zWf8K9Ky4cH3
	YcEVNElbkyg/UF/aJW9/Atmkps1YHwcpSx9SlaBPZwF5a6FSP4g4MTnpnisq3781q7Q==
X-Gm-Gg: AZFdTZdKdnm31Lkadp5zUY3QIUuCEqmmx9+iNP1HQfPGbNahDpzI7YzpdJHFadXvOzg
	RdGc1WAeg+LZIp+QzgQWCy9PwBw8E7et3KUpcn9QN+rocEPYJANVPPLRHQR+HwcOdWs6xm/iC5N
	wK+i3vhnsIoToB5anGplzjkiHr6jvFQU+0dGx9aagENyCQofzCl1wZh7A43fzVLnu6WeuYtQsRE
	QQS48QEACqT2jCG7jpZFuz+11Y8UokKnR5lAPiax3i84taU+qboN/51yGDyXxlt5LLqYq5QQofh
	pxUxgYRHWv1/KP7DQxwCCjBAubVKr7W3wCgO96PUyN0OUUxubz7diud3uQ+B4Ye0wzOrabJzQaE
	0xPjt12C+wWkeoAYdNgMQnb6Bo3+RjyntJsoXSncCaXoVz/uDTcfEmgbSwmy6zC9RN/ZywaE/J8
	a4jBy8enYUwzH/UnO8ap5IjFuHtYbqbxfIYyprjJUBslNb
X-Received: by 2002:a05:6000:2c13:b0:4a6:9f2f:4153 with SMTP id ffacd0b85a97d-4abaac57ba9mr38614704f8f.1.1795686697231;
        Thu, 26 Nov 2026 01:51:37 -0800 (PST)
X-Received: by 2002:a05:6000:2c13:b0:4a6:9f2f:4153 with SMTP id ffacd0b85a97d-4abaac57ba9mr38614627f8f.1.1795686696684;
        Thu, 26 Nov 2026 01:51:36 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989e3sm39627871f8f.52.2026.11.26.01.51.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 01:51:36 -0800 (PST)
Message-ID: <e07adc3e-838a-4c46-a56c-eb47bb9e77f4@redhat.com>
Date: Thu, 26 Nov 2026 10:51:34 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v3 2/2] selftests: net: check TCP IP IDs across
 tunnels after GRO and GSO
To: Julius Bairaktaris <julius@bairaktaris.de>, netdev@vger.kernel.org
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 willemb@google.com, horms@kernel.org, andrew+netdev@lunn.ch,
 dsahern@kernel.org, idosch@nvidia.com, ncardwell@google.com,
 kuniyu@google.com, steffen.klassert@secunet.com,
 herbert@gondor.apana.org.au, richardbgobert@gmail.com,
 ecree.xilinx@gmail.com, andy.moreton@amd.com, alex.austin@amd.com,
 linux-net-drivers@amd.com, saeedm@nvidia.com, tariqt@nvidia.com,
 mbloch@nvidia.com, leon@kernel.org, linux-rdma@vger.kernel.org,
 alexei.starovoitov@gmail.com, ast@kernel.org, daniel@iogearbox.net,
 andrii@kernel.org, eddyz87@gmail.com, memxor@gmail.com,
 martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev,
 jolsa@kernel.org, emil@etsalapatis.com, ihor.solodrai@linux.dev,
 john.fastabend@gmail.com, sdf@fomichev.me, izaiahsun@gmail.com,
 corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org,
 shuah@kernel.org, bpf@vger.kernel.org, ipsec@lists.linux.dev,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <cover.1795284858.git.julius@bairaktaris.de>
 <2f75527eb49d7d4ffec32a61fd7dd080673dc57f.1795284858.git.julius@bairaktaris.de>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <2f75527eb49d7d4ffec32a61fd7dd080673dc57f.1795284858.git.julius@bairaktaris.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/21/26 19:27, Julius Bairaktaris wrote:
> Send TCP segments with fixed or incrementing IPv4 IDs from a packet
> socket, let GRO on a veth merge them, forward the merged packets into
> IPIP, GRE and VXLAN tunnels over IPv4 and IPv6 and into ESP tunnel and
> transport mode SAs offloaded to netdevsim, with segmentation done in
> software, and check that the IDs of the IPv4 header in front of TCP come
> out as they went in and the IDs of a new outer IPv4 header are unique,
> or for ESP tunnel mode increment within each packet. Also forward a
> VXLAN stream with one header's IDs fixed after decapsulation into IPIP,
> and send the merged packets through a tunnel that the far end
> decapsulates without segmenting them before it forwards them.
> 
> A test where GRO merged nothing is skipped.
> 
> Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
This test is very unstable:

https://netdev.bots.linux.dev/flakes.html?tn-needle=tcp-fixed

/P

