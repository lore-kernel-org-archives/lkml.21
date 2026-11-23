Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795431414;
	b=3XYQTppTC0GUCCszMHpTrN2VT5WYe4lGFXD8kYWHr4NO7rjSWMr9nJMye9NaSVGG3oU9
	 Wq8T4luiwa9xtEa5Cnq8B0+oHDZgtEHxu1X/qhILV8DRVgitZxdDtq6NQejSHgTjS4Q8m
	 9meuU2bKm1DNIbRqm9wLofeJdfr/69uB4MLg6UoE4P7AitE57Z0vCC70nJmdfCwXhIW+G
	 r6B+/4Ihq4ggkpmhhdlayPpCKOeYIMEM4LVOTbSQza/YySdgPoMEoVts9QD5u1gv55T3G
	 0Ccseutdq+8jIqimLBOOLp7l2Tvcnw35d9QWEj0R6bdbp0+Ijs6bTcVR5Vdm1GiH6jQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795431414;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=yhz1BaZJyup2+y9gHl3tJiv5++3fhydk0W+zQxSzg/w=;
	b=OKfRlBj+6AJMx5i9nXyjXF/lMD+9XYCQzPZemf6xe8dHu3ECo1Y2z2ONESYSLcg1TF38
	 opgnZIN819j3dPzemCdW7W8nLnWRei46TqHJXIK/GQlfQ7lhswIYZ1ji21dLbWeSN0/su
	 WawdmZbeflQ8lpHXwzPrWHWVZFvDMQWMLHyMoe5S0g/w6WAY7mGfJ/7ukEhWfv4URA7+4
	 Hl3BR1fF81raCbK3zPGPlZq4db5DT0Bg4WkqpLMo94lQ7f/uCAVUlCQ3odqMKfjCWqnzt
	 H16nbMpHVXiVPWfK2PFjC+6E6Qf/h4fUm4fFJ0QjXdlAnTvtrtt13w3yY55L1Ojg+2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=f0Gk1yTT;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=e5Sv9Md6;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF010606A32C
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:56:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF010606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=f0Gk1yTT;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=e5Sv9Md6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795431413;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yhz1BaZJyup2+y9gHl3tJiv5++3fhydk0W+zQxSzg/w=;
	b=f0Gk1yTTvlduU0wor8DMHKad/D9L4CvYTSkj93NaYiOvbQPhQAO07N5EV43RdaTqzyzyDw
	1NGlD8KQJZm4hWZSHGdCETo9jmLaM2vcs/gqa3fv8+z2eLuwsAWHSUMXoO6uyUNZmYkOAk
	ahdPITvytALvXoHCxnrEdehKO6DT0JY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-651-SUACYIwoMsmOwYbdO4tp3g-1; Mon, 23 Nov 2026 10:56:50 +0000
X-MC-Unique: SUACYIwoMsmOwYbdO4tp3g-1
X-Mimecast-MFC-AGG-ID: SUACYIwoMsmOwYbdO4tp3g_1795431410
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4a4654add56so21354245e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 02:56:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795431409; x=1796036209; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yhz1BaZJyup2+y9gHl3tJiv5++3fhydk0W+zQxSzg/w=;
        b=e5Sv9Md6GKX50PFxkzRXF614O6C7L5bLQjRV6BxF7Glddk8XXrYrZjgTzcmSAuEifi
         6ReejKJX/DnqzrXoNkMtg+894/4LKR4gAZo+M1ZgRYJcgPuwpSCD+3ffp+rZ7vA7CffA
         X/NPXQi25DI5/hIzcT2s2r5Hq/5+/U5S/kg5cuLwjvzhLrq2RrdMe5a4Nj1I+axmIYTK
         gqdTvnFWS/eJu+GUMJ0zI6mFkfqigOGXVRJwVqCpA2KSR6OW5GpVnF2eBcB8sbRoeCPE
         NtwGPFv5s9Q11xZy+nzBU4l0NbqbG2exclpd0xPn/D40fFlZVFRltRqDtQlu8GRQjuHs
         El/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795431409; x=1796036209;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yhz1BaZJyup2+y9gHl3tJiv5++3fhydk0W+zQxSzg/w=;
        b=rMSXHXj831nYzP09oou+g3/aC48xbP2HNTcjG0msAr1v/gM/4n9ys5WFsZgU8eaexT
         6BgcDn0rwHpiDJ/xudf9JRi4/bhCqyNISukyniKIGn+BOgHZw+kzzgZb4vU5ka/0+h0y
         5Jm+JIgXPoUin0I+y0MpBwre8HUgMQZ/DS2XGgNJRMvQ9menNxOPFPkRqWkTHSrS9Ns1
         SUXGDbCaVpHKVopyUB8/J1f0S8B0sV0oh9QPu71uxowTEen7Nrk2OKppO8vQvtHECs+o
         pLMnLr6OEJqk4XVWvntcuhSP7Ds3ArPFFRbvVsFSGj9NI6/civMnioF+BgtHCQfhoZTF
         wGWA==
X-Forwarded-Encrypted: i=1; AL+hErGuIQLvC12cXsPl7BUBz18q0zI8uuEvTx9tuaKmMb8Cma9zs1Ohp2gPg9bXV4Oxi2VOM8aTJMbvV+johuU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+9mroMAZyq697QJqSA3dFlK5y1Zc7EAoOqnvCobpms7aUQzVOw
	DJTQZK40PgLmsnCQmwiV4V/PX3eR2zodhFqRtbbigS8+VYotuKNNUmT3ilukxG5khvjuVt/1p3z
	pjmooSC+0rEpXU2JkR1zkJ10LbmiBpNYrFEVTxdoeVKiAAjAalSycjk6BNXEJTpPPFA==
X-Gm-Gg: AZFdTZeO0xUrdPCtvwFvMnBwRZl+3W4acNUES77ojjckBxBCDC6J1Cytu27PRY+a/ZO
	p9pRTHq+h58iPF7+5exLOdam6aXmKH3dyQdSnIEvZyEbPsapoAJ/OYyeod3k6db7R/qw9gVufla
	VrR6sNrJlBLpUAOvjDKaKIfbnqYl/u4iORZlLUvbDPdmKgnuLKWqQB/IdJua5ssSJsfUcb0q1VC
	qnG2dsZueqRoijlo8y1K2OKNATR3Q9IFKn1a2JGgy+jS/VLAzfIKhcZ8dbZ6EL51WH2NL/3Okih
	CFJHn9x2z2d7wQOZ+OO4Q9MebYiHZ7umFn2YzFiPmkaZSLnLKaYLnorcoDxcSiIIvmFbPca+dqu
	3oawRMD4g5EPGDBysucirkPXEh75KO7nM+DcGNn19ue7NJWASerLDSQ8lBXxPVug4NspbfT6Yzb
	/HCsiBV79pCq6t0OWw0dTQcMgNb39gPWNJZXEN72hvgQs1
X-Received: by 2002:a05:600c:83c3:b0:4a1:7e77:c382 with SMTP id 5b1f17b1804b1-4bb8880ad68mr218950505e9.5.1795431409604;
        Mon, 23 Nov 2026 02:56:49 -0800 (PST)
X-Received: by 2002:a05:600c:83c3:b0:4a1:7e77:c382 with SMTP id 5b1f17b1804b1-4bb8880ad68mr218950095e9.5.1795431409222;
        Mon, 23 Nov 2026 02:56:49 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf6804sm21090104f8f.10.2026.11.23.02.56.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 02:56:48 -0800 (PST)
Message-ID: <250c2bb2-57d7-4f91-a32c-8f6ac7d55a46@redhat.com>
Date: Mon, 23 Nov 2026 11:56:47 +0100
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
Subject: Re: [PATCH] rtnetlink: fix NULL pointer dereference in
 rtnl_get_link()
To: mdshahid03@gmail.com, Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, edumazet@kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261120134548.214126-1-mdshahid03@gmail.com>
 <20261120100415.363fcb19@kernel.org>
 <179525944307.361783.17801110279499293110.b4-reply@b4>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <179525944307.361783.17801110279499293110.b4-reply@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/21/26 12:10, mdshahid03@gmail.com wrote:
> I tested this issue on both original and patched kernels in qemu.
> 
> First, I used a test module to unregister all PF_UNSPEC handlers.

Just in case the are any doubts on the poic: if you need a custom
OoO kernel module to trigger a 'bug', it's not a bug.

/P

