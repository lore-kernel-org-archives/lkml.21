Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795436865;
	b=MHqKrcZGNnKnU6NHt5F7+TW3JhoKvZrbVyNmFGFkhbsKL/mCUsqf8t8mfdmiJjFvc9nB
	 Dmm2LvuKumDcxUrDUMxFL18aU+4wHcwklHFB+WgMUfKoBfW6Exm0xUvcrBAvQINIbPbx2
	 k+jwELsFHX1GGtmb0UT+73D6YfDHvz2zXDFJKfy0i4CJ3KlahRFXwqNtlaqWUjE+3RNEW
	 yJlivsIprp87H0WjMwMzo4rP+ovlTm5pCcbKalDmybfOquZ3/VEIydsYq5uOc/+rkkYjI
	 ifBULwd5+VX6FZkzTmETqIkwS3lMUgQ7kzxWZ6UprW1JVgROrCQ6HlraYEk7OmDoZFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795436865;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=VPJ4qxbI93bPzZzijKlNpT2z2hanGh/YCxc/VAqAnNU=;
	b=TkYRO+iPXuXpUZPA9tSmMF3UHwAGs8dFm7LxGKZTOGbbZB6s2vSSxgLAIqE47Md862UJ
	 q0IMEq8zpSCSKFVayKYDlxa4A3rMziVw7SUtsroBDe6TRuTjXN3K95idSRhyOyC181OtL
	 nnVR6pLE+P7HWyS1RRmA7LRJTFb/PIhwxmh+mWczTqOx7fhNWWAhyu7aSR4U3C0fM4ov7
	 2T+ygT3WqY3Z8EHIOMQyNT4Bp9MM/1iBQjTrcVt/4KemdtZvenygpmZpIJqHL8QkcKjh1
	 Z8evh3N6gErBXn6vtQitPzHVx+kcQ6uSW3tk2uEpTerMhU9XcS2MNFKqTW5XzAvt0pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Uh9SPbHH;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b="YMM0r30/";
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D468B606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 12:27:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D468B606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Uh9SPbHH;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=YMM0r30/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795436863;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VPJ4qxbI93bPzZzijKlNpT2z2hanGh/YCxc/VAqAnNU=;
	b=Uh9SPbHHZiKlPzGCw/NjXzCM9ZsqSjejfqLoxRAzxJ6AChF7OPIFADigZVIPEVRNupXgva
	Cfcf+Ndk/WwxVNhCzYTaYN10ja5EHKXhbzQDt2mificgZfmHPa7MHGT+qDlh3fJInauw7L
	SChrQPxqhVUhilq4Z535MSd0igcdmzU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-635-B7CT4EPuN-aITygQrGTu9A-1; Mon, 23 Nov 2026 12:27:42 +0000
X-MC-Unique: B7CT4EPuN-aITygQrGTu9A-1
X-Mimecast-MFC-AGG-ID: B7CT4EPuN-aITygQrGTu9A_1795436861
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-48e0af48c18so1955205f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 04:27:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795436861; x=1796041661; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VPJ4qxbI93bPzZzijKlNpT2z2hanGh/YCxc/VAqAnNU=;
        b=YMM0r30/1FOYi0d5us+CD1V8yqGm8dAiU0V3hSguhGVgfBpBxxePLbrR49r3SbQE54
         efGdwpdwwN8cz8+TjcyPH0G4B+4ARjNeP7Dxs6JVANgdFYEfvqYpkUt+pnw4L3YgnmHf
         vDuYplafZglf5pzfmidinFQ5hX7QSKmANdeII1yZpGlZdo1/Av2zA/osHDKpD4oJmYIF
         /9yNOkcWmO9MvnSH2vqjMapBT3c5JYFLvxVi1ZYZoc/8FeFvzjoSOds8J2u3YCOT07gp
         N9x9RH84BtFQ55FgXqxKDA5s/WquJaG53+vw+QzpAx5wobVF2pRqsMShL+Rp7M+UZCNj
         3npA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795436861; x=1796041661;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VPJ4qxbI93bPzZzijKlNpT2z2hanGh/YCxc/VAqAnNU=;
        b=MsgkmlETrXaATs71qyIcgXO48qbGSRa7aM/+8rtAukst1gwCyFCrEhH5dolt82ryyh
         vqTYpK9BJO9WoQAlnvD2ezrQlBaVuHyNu1+dUan0Lt7XH9nkgFSJygYFnIiF42bOqLbs
         YObnyMypmtv8qLmTGYOYvMZNGnX8/MhSFZukP6T74ixcdRtZ5bOCjkr/3uNdqEOY2Z2H
         a01MAoAhhXtFeug0e1QwGoJQPpK16x3949ZagOTzc57rBp0blEzpPB6PRdLrl4oMkLz5
         0IUnmFL/B3l6LzY4T6/R0JArn8oirNVJbZ5H8vs94y1gWUsfdilIbiSUQRYQtwKZ2Qqt
         1l/Q==
X-Forwarded-Encrypted: i=1; AL+hErE55LOMdCkoWR4yu1cD85TDpimd3X7Rtg1ExH5RCKwO4jhHy2pFPY4WXrDk7mMi8GSYsUTbFUA9zPlDG9Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Nroqvpc78D5Xl+yLbON/sDKdC+Y6gqEmnIBAIq97aBoM352gW
	Yg6KfgjdAvum9fOVb8THVQTpwVYKwgZmM/05o9DxMFlQ35IUXqNmlzGmuASa565uVAB6NYvKkq7
	6TafGs0GHUeLdPLoD4fpg5Ty+nSqMUd/4mjt4kcTcoZ5/zNRt3k39l/E3MXgnqNSi7Q==
X-Gm-Gg: AZFdTZeWM07xoEZ56PSwBrdgGuw2KaKOWkL8bGd1eyvxtpJFOwU5WNIf1KkY576mcbs
	TCz3nrkAjiAFHcM2ofiFlMl5iFuGxCQC7fKsyFBStBn+pQqf1fc5ejKdzWItiXTtOMFEWdk57Ei
	csNES4W426VjN//22iEifeDNfLh8gq39EhPGKxF66ciDRfMn8D+Wg9rvkMaqaKwTJ13EjmxS6Wt
	DFR9Lsj/5yOoSbP9jMpJdpwItRQaStBvOxaqthrNZCSKbJcsUGvPJ5bQqlNiW0mTDwUASeXdFnc
	lEuEOR6ZW5AkYO5VMFXLwe1w2h8L162dCw+svqkDlrp1R+YUO/i4N61UEuEpBXbc9EZa1gY7c5K
	g4oTnHOIKW7yuTPjb4WbMia38WuyBa4VYqFCBwdcHYSZV+osBfw8g05aj5mRpQQgSHsdM+qOTmU
	SzWmaeDjL5/v7ZH+1Myhj7rKff8nszRRBVQaAo7BQe70j0
X-Received: by 2002:a5d:4492:0:b0:4a8:1b63:215d with SMTP id ffacd0b85a97d-4abb6eed6e7mr16616464f8f.27.1795436860779;
        Mon, 23 Nov 2026 04:27:40 -0800 (PST)
X-Received: by 2002:a5d:4492:0:b0:4a8:1b63:215d with SMTP id ffacd0b85a97d-4abb6eed6e7mr16616425f8f.27.1795436860290;
        Mon, 23 Nov 2026 04:27:40 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b5f6sm20481994f8f.34.2026.11.23.04.27.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 04:27:39 -0800 (PST)
Message-ID: <6aae7800-5306-4839-a4c8-56265a0fae45@redhat.com>
Date: Mon, 23 Nov 2026 13:27:38 +0100
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
Subject: Re: [PATCH net v7 1/4] net: hsr: keep GRO disabled on HSR/PRP ports
To: Xin Xie <xiexinet@gmail.com>, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 horms@kernel.org, andrew+netdev@lunn.ch, shuah@kernel.org, kees@kernel.org,
 petr.wozniak@gmail.com, qingfang.deng@linux.dev, fmaurer@redhat.com,
 luka.gejak@linux.dev, bigeasy@linutronix.de, xiaoliang.yang_1@nxp.com,
 skhawaja@google.com, liuhangbin@gmail.com, stable@vger.kernel.org,
 sdf.kernel@gmail.com
References: <20261009201324.17-1-xiexinet@gmail.com>
 <20261009201324.17-2-xiexinet@gmail.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261009201324.17-2-xiexinet@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/9/26 22:13, Xin Xie wrote:
> HSR/PRP add tags and sequence numbers per wire frame. GRO can merge
> plain interlink traffic before those fields are added, and userspace
> can re-enable GRO after the port is attached.
> 
> Mark slave A/B and interlink devices with a kernel role bit. Filter
> software GRO and configurable GRO_HW requests before ndo_fix_features()
> without changing wanted_features. Filtering before the driver keeps
> feature dependencies intact; fixed-on or driver-required GRO_HW is
> left enabled.
> 
> Apply the policy before registering the RX handler and reject attach
> if software GRO remains enabled. On failure or detach, unlink the
> upper before clearing the role and recomputing features, restoring
> the user's last request.
> 
> GSO skbs may still arrive. A later patch segments valid GSO before
> HSR/PRP processing.
> 
> Fixes: 5055cccfc2d1 ("net: hsr: Provide RedBox support (HSR-SAN)")
> Signed-off-by: Xin Xie <xiexinet@gmail.com>
I don't agree with the goal of this patch. The kernel allows a very large
number of bad configuration. Explicitly preventing one of them may
lead to regressions and leaves the lower device in an inconsistent
state.

Please drop this patch.

/P

