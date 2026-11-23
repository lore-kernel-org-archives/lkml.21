Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795435125;
	b=MALLbNsFLFO+siHh/AbHdYd1w2bHhCpQQAjuDf8LvSOA0K9kN8eEeAKD2LJx7Ydrta/+
	 Ec/7jbimWM7Hd5I6GuBivzmoaX+D3AJ3CUVpq6I1G2BTDVvLR07jhfVoxSe1cfvgs0tGS
	 tBszFGEsDMcRpCTER9ueiI1hbd8UpazrbaRzIGU+96HRW+daN3HZMA/K7FV14hd1TOV3N
	 XH9QaECV2pw2mOMX2h7jD7PSVQNylipeJNJTduicKMjoDH56aJ8ECdQJzPyyJWNpVG6hW
	 FmBOkc93IOV3w1D3TsIocrlCN3mVO59lLytK1VjfV/D8zHpB2gL78VgPtS6WAWdlnuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795435125;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=CQFmq1pcPFYCkE6jKPYZE7YR7p9AbOoikjbaytK0pAI=;
	b=uIWoUj7QBC0+diL8MaQHBhVDGXFdQjPSU+DQoWkjorXNX89GtZVUh5IysgEhk1v2p3at
	 j1hlIjX4RVwDlORjwsOpITq7ZZ0hX/9J6tY18lTDk2hvJ/dtHp9b/j4jtijT+OtnhlCQv
	 vFVwaaKM9UYZfZymIF7YwBuZg+tBs7QHj67z6kuPbxEFP9+2EQ7CiQLv5PSHDufFxvkpG
	 k9l73E3l1jjL3CdHWrYTuEwGuhoIDo158Ew/TfW2y3LWb1XSNbWTioUTxXhgL0BJwvt82
	 sph7cvaKbLcMaUJFjYUxYENb42A+UOGWmaBbFHFX2dtMCRjDDQwJchjjlA73pO3vVAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WVyIUyKV;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=q8TvksT7;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F110E606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:58:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F110E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WVyIUyKV;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=q8TvksT7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795435124;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CQFmq1pcPFYCkE6jKPYZE7YR7p9AbOoikjbaytK0pAI=;
	b=WVyIUyKVj5fBF4k4rbvny0i3aN2XVanH0LIcFu5Id8t6l30DKQhkKuArKZigQmuy5IZHfM
	jW+s/VgxGFFyxLoOpXnrvbwY60271EyUNPZJop+MmDc98Eo0TRhuDPPwAc9F1WOGNNCtvV
	Nm/fHesEa6wqnLMMQvaC1UXKtazcDFE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-299-A9bx_62RNAeMEMpouDYaNQ-1; Mon, 23 Nov 2026 11:58:42 +0000
X-MC-Unique: A9bx_62RNAeMEMpouDYaNQ-1
X-Mimecast-MFC-AGG-ID: A9bx_62RNAeMEMpouDYaNQ_1795435121
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-490d2ac331bso2782035f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 03:58:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795435121; x=1796039921; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CQFmq1pcPFYCkE6jKPYZE7YR7p9AbOoikjbaytK0pAI=;
        b=q8TvksT7v+CwaSNg6yS0Ed+NoDfkvAKLjmmEv1N6E+Ohw/DzECgpHU/dhfU0sdnuEB
         GH7KNmXRPUHXc5e68qXSP8cqyHF3XOj5wjU7pbkLvgCw0e+kcwkoEkYxpH2Zug+m/sHu
         dVOOVUoSeobuB+fj1j3Fl8viG4yqaJoaB7OCwD547OI7b0jQj5BK5TwuOauxVLFsuj12
         o+p+x8xr3y5Qv175Vg4ag4CkJvDPS19ioV48IY7bGhucRGecgMcWDrGTtIyaJdLeI/I3
         s9HULmRI2IyWBl13ki4YeM2X1DP1Gg0vgBJjNONDTetVN+f52hj8vycFuKePFzj1uAK7
         NP8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795435121; x=1796039921;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CQFmq1pcPFYCkE6jKPYZE7YR7p9AbOoikjbaytK0pAI=;
        b=G/FxJNgEb9WeuTbOTfkqMP0eMh+95MGy5uoSoIM2BLlXiH7XloBfHyhjoiMgAwO8KQ
         ph+70zKO+eZHIFQiR12LCtG1ZbHwiEtpPB0MRZw8vLCgGwFN9MpR8GrPLkCwIbCE9dbF
         7XKK50VGe5kuPPFMgE/GaTc1/q3rMmhZ9nOBCHtI2kREeCmUguQ+dy5dLFK0xciJqZ/U
         bXRD2uDNcDUDWZkwotUiy4S7hX0pjZ5PGv5JbqjTda9cdgpTZaZyEkCw4IaWmkjL/vZP
         QGenRvUvtyyVrMBT86de69iBQiRb6gcPDSLMHwHMekJxfXwxIjSG65Ooga1wOmrPCdqp
         ZT9A==
X-Forwarded-Encrypted: i=1; AL+hErGUcCRnID42ObzJ/pSDokx2ZjK9LjcPgMFIiMkeSwXuPzYDO4E7+4A9Jt9RRlwyAtXZQSJOAfCJlGpRI+A=@vger.kernel.org
X-Gm-Message-State: APuU4Z89ACGGdtYOZNBnK3PRaFc5zfGRY+FMdxHt/NmYZXpWACOR1HDB
	tSqKLQqQeBlDkoYiKIRR/34Aug5JuhkCIxFHin8PFfW0hMLgozCMOfXy0UakmI8XIeVy0loSiqs
	2GV+eseJYZfbNXVzindy7dCkVIg4S3qjFw35hovD2fOrPf/RCCN0USzTdkFoR8mQkxA==
X-Gm-Gg: AZFdTZe+M42/qc3XA4XyBBSG1tgQ9kXKkkuDTrSveBTARobqtE3eIKS8gyxBd47WZi1
	RwrrapL16DngtcBgnC0uiDwesAIA9CtsUthAGuOE2+px20JMXxRviviqI0lX/cEq5YKTtqiwST2
	A6BdK6m2d1poMunGMYYCv1QErxUCZI2bxVJMNyn84C9gzJ/4wL4cocxRCzY4lrBy7rJW1kvUZgn
	Ds+gVrEmKr1mZM4xiBFnRbQgGwXBthL+ruuzbkNkihgekQkpuxchmY9Zf+jMffIp9UkuTRJNKJi
	r6Cj5oODL9h3KInN/QtxfTSIyI/BWuwS14St4vqRE6JIavSZPKq8j4g+8Fd29vbCbqZ/9/ZBHQJ
	2J4fkVr093b6nbup8Efv+cJNTn42a+82J3K7jaXilO4bgsLZkeYFhr7Na3/TcHZHCd2BISSQdWI
	IozIm1TmSHqZpOD+bTCTIYJVvcKso1qoctsozg0EZeuzGi
X-Received: by 2002:a5d:5f85:0:b0:4a7:1613:7206 with SMTP id ffacd0b85a97d-4abb57f7b6fmr21998998f8f.47.1795435121073;
        Mon, 23 Nov 2026 03:58:41 -0800 (PST)
X-Received: by 2002:a5d:5f85:0:b0:4a7:1613:7206 with SMTP id ffacd0b85a97d-4abb57f7b6fmr21998958f8f.47.1795435120674;
        Mon, 23 Nov 2026 03:58:40 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b2c9sm22672307f8f.31.2026.11.23.03.58.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 03:58:40 -0800 (PST)
Message-ID: <12a2b44d-3d24-4b77-9dd5-24361d5fe910@redhat.com>
Date: Mon, 23 Nov 2026 12:58:38 +0100
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
Subject: Re: [PATCH net] vsock: only deliver taps to namespaces that can reach
 the device
To: Stefano Garzarella <sgarzare@redhat.com>,
 Bobby Eshleman <bobbyeshleman@meta.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Jason Wang <jasowangio@gmail.com>,
 =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>,
 kvm@vger.kernel.org, virtualization@lists.linux.dev, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261116-vsock-tap-net-v1-1-7e24f45adad3@meta.com>
 <awQJo8WE5Gn4nYHp@sgarzare-redhat>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <awQJo8WE5Gn4nYHp@sgarzare-redhat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/23/26 10:43, Stefano Garzarella wrote:
> On Mon, Nov 16, 2026 at 03:46:49PM -0800, Bobby Eshleman wrote:
>> vsock_deliver_tap() clones every packet to every vsockmon device on the
>> system. Creating one needs only CAP_NET_ADMIN in the owning user
>> namespace, so an unprivileged user can capture the traffic of local mode
>> namespaces.
>>
>> Pass the packet's netns to vsock_deliver_tap() and only deliver to
>> devices that pass vsock_net_check_mode(), the same rule socket lookups
>> use. vhost passes the vhost_vsock netns, loopback the sending socket's
>> netns, and virtio-vsock NULL (global mode).
> 
> For local namespaces I think we are fine, but what about global?
> 
> Is it okay that a namespace with global can capture all the packets of other global namespaces?
> 
> Asking because at this point the CAP_NET_ADMIN is useless, since an user on a global namespace, without CAP_NET_ADMIN, can just create a namespace to have CAP_NET_ADMIN and access all the traffic. Should we fix also that?
My take is that the above question is quite orthogonal to the current patch
and may impact old applications relying on the legacy behavior.

/P

