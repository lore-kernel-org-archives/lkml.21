Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795010511;
	b=EKyhG3HmhC1PWn3DgXV7rJJSiB72+moNkgjUTX6cnl4cKzpL9/XiVEheTZUjO7CnAgiD
	 W7wqiPWiCiwfte6OzZfpLruVyJ7OPEaTZj4XPJjnFk/yT+m+zOcVzsw3anbxNZdvDEFCg
	 OCAVxYMTMZ9YY9mCupTJZB5IiGiCFNwTQ7AWJEfsvXk/+M7cyPv7heWxl6OOo+MP5k6Hl
	 XnXw+XoJOc8yYqvtDzWasMKcgWiwGtDaY8XpAqprgf5lTa0iU1jo3zwi/0v5faYI1k0ll
	 EgDvuwv4ZdhWO6nAGxQTMavxfuj83MHwRryjqRkh0uTs2VL3ckAG9H+rCUctyIQaqxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795010511;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:In-Reply-To:References:Date:
	 Message-ID:MIME-Version:Content-Type;
	bh=PkSCWwmCdxKWhi5Q6TGdM63nZPvXC/gAB0JhnmD8Sl4=;
	b=SQurzAzzpylga904mKx5SNwL8AAY41Xd5IZJZ5dx6w6TUBTwco7BB72ZHA6XdfAM3e8C
	 r/94xdDc2y7cZe6VKwbyy+YL5KVpmsc899r7YSGUwYFuAKLwWBZc/2wK/vLS7Bx+3nIIG
	 tPnqbtUr0l1DxrH+ktgK8n+5iMRfZRfnm8JRbZELIBOea8+NplQ4h9xv5lxUvekR1VBFe
	 c7zdcwa2JzXXBgcOPgGft/L5Zp6Ls+e8wsYp4zQ9Hv/N9qV/NUQg7S3hEe700XIJx0TFo
	 68iXaUkq3sgtSPHIm2pTr75g2mbbVEM39w/KHY+5aKr270svNRHJaxwi+hv8YwYZnkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="NIO/KqI8";
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=L+RQQmI+;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68EB3606A32F
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 14:01:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68EB3606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NIO/KqI8;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=L+RQQmI+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795010509;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PkSCWwmCdxKWhi5Q6TGdM63nZPvXC/gAB0JhnmD8Sl4=;
	b=NIO/KqI8Sq45lKsPVSNfd0ONoWrs8B/2vNxhk6qjz419tbKUvrgYYSVQ0y30Wk3BVP2Zu/
	t0atBPNGcjn4tPdpj7APfB/eredM+0zK2b6+4VyL1LCy9FXGA/YASgnHdXBKGaLcCZK0VY
	WWKW1FZb3hN1RzkBEaYvJ8nVzu+ygeY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-624--NPK8tpYO4yccUTCZfeBkw-1; Wed, 18 Nov 2026 09:01:47 -0500
X-MC-Unique: -NPK8tpYO4yccUTCZfeBkw-1
X-Mimecast-MFC-AGG-ID: -NPK8tpYO4yccUTCZfeBkw_1795010507
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4ba078abd78so6620975e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 06:01:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795010507; x=1795615307; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PkSCWwmCdxKWhi5Q6TGdM63nZPvXC/gAB0JhnmD8Sl4=;
        b=L+RQQmI+X1Xcnt5ovpb0pxxf+zIUkB7fwH0bbxyFYcSNaVNQVG/jM6f1C/VFHP21Xb
         HPsQ2r/nesMG2B7knbWwlfUUeBDE4Ur8+iq1KbNTPfrGw2ZZg1Sx0loxAbp8Udg0lPBa
         vudfv3uc8RQ5zTAGA5gOwSmroOVk+lkNKVumHzoVOdGodjh3CKIL7dhpzhU8no6pwqYQ
         dXgUuVKv0K51oxKMfl45OnmUx0ejOqnQNdGf52mlEPkDbXofqgstUtKjfUJ9HpDr2HSc
         fym3HdcXwY0cnxiTGNO47FeZkQjlvSUzc0xTXbFXLH6IraTsvLycBkXa8DxCEGrqG4t9
         P73w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795010507; x=1795615307;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PkSCWwmCdxKWhi5Q6TGdM63nZPvXC/gAB0JhnmD8Sl4=;
        b=kHfcAW1BHU6zBj3JfdI9R9yTK7ItM6YYTk7twO7OcRNLgdPKzIpJ85oMkEQmXnHz1H
         InrOI5PxjlrE0beBgrM9dWpAMNL/hpfT4jdnfu4YX/Dd4F+hFlttwZpJ1ziM3xQhCTdV
         BWB41HKolsdwslMpO26iaEVb0D7t104egpXJJs99fS+YxA3yUOpjM8Ig1sP2RO4qkEOD
         /s7p1gZ9pABi/L0oc9gJ/agt60cOAgobdfw5yzGKI9SvTyXFiljpaxI9Td9AldraBQLP
         lLJTK3zJRIsGuvYYeQ2vrG5xe0mc7gvldueSiYxafvxyXPrWU3miJw8QyFUETzAV2txw
         h+Ug==
X-Forwarded-Encrypted: i=1; AL+hErFrAr2mpRS5BTKEvExTwKOOSwwjfv4uN9Bpk30Q7aHiY+cONMco33fMWafdwrXg2v2x9dDDR3Kf/cFPI+U=@vger.kernel.org
X-Gm-Message-State: APuU4Z++OuoO0jZTnq+kpxsQ75HtNPxU5RHpmAi+Vt/rd0iOtXJsjQxa
	yP9Cu9GidvFS8vnPFAHLngtl/ZPOL2scIpIrxEgjrWVgWRBUwLZaFTlxTw8tOihGk2exEul1M3R
	vzGQNScrcjSbDjOYQv222W2IKhoJ0L8KGMwGOryYS0MvJvbq4L8JQJuxnweNFotBIeg==
X-Gm-Gg: AYBFou0JrimRxFtZlNrGVzGtPc5t99wLD10VGh/GEIJEmuSVOUA6HvXYO+s35YoBIBE
	QciHGTQtghOIssxGjWGVOecn3dGjYuiHNnXXEu+xjv9HJ2Nuk5x4mbdkOoiVrwA8/XHB14JbE6v
	v/ikkyWkVOcqVjd+SIwP75fcFHuJ2VAvct5UoqiRpWd2EyUITS8o7frsCQrcpi5E6OjyIZMOB4w
	aPh4YtBoVHDDySfXKaJzGDvkv7zP6eh01txsxxVm45G1aUStDc4fCFmmjhxP99mLUl7JPKgxIbC
	97mFegzUSiiFpfanlVlM4wIJhmRjmRwvpFAxJrF4rGtctNPrCARz+QcWgX95IS2aINTJ00qAAcC
	x4dCimNjfxb1gaeP+dlaGJy/aOClXa/dz6fRslel+a5J9wZJ7poH2sesHFagTEVs9Co0lZBG+6g
	UV7OUbSwUupIubvpM=
X-Received: by 2002:a05:600c:6746:b0:4a2:729:f7ce with SMTP id 5b1f17b1804b1-4bb7da12d14mr51401145e9.8.1795010506678;
        Wed, 18 Nov 2026 06:01:46 -0800 (PST)
X-Received: by 2002:a05:600c:6746:b0:4a2:729:f7ce with SMTP id 5b1f17b1804b1-4bb7da12d14mr51400805e9.8.1795010506261;
        Wed, 18 Nov 2026 06:01:46 -0800 (PST)
Received: from vkuznets-thinkpadx1carbongen12.rmtcz.csb (g3.ign.cz. [91.219.240.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7d29c614sm68878365e9.4.2026.11.18.06.01.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 06:01:45 -0800 (PST)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Mukesh R <mrathor@linux.microsoft.com>, Michael Kelley
 <mhklinux@outlook.com>, "linux-hyperv@vger.kernel.org"
 <linux-hyperv@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Cc: "haiyangz@microsoft.com" <haiyangz@microsoft.com>, "wei.liu@kernel.org"
 <wei.liu@kernel.org>, "decui@microsoft.com" <decui@microsoft.com>,
 "kameroncarr@linux.microsoft.com" <kameroncarr@linux.microsoft.com>
Subject: Re: [PATCH V1 2/2] Drivers: hv: Fix bugs and issues around repeat
 hypercall
In-Reply-To: <bb569c87-1a60-c498-98e4-db519e4d7d24@linux.microsoft.com>
References: <20261114025313.1257042-1-mrathor@linux.microsoft.com>
 <20261114025313.1257042-3-mrathor@linux.microsoft.com>
 <MN2PR02MB6863E6C4F59864B7833681FCD47D2@MN2PR02MB6863.namprd02.prod.outlook.com>
 <fd130973-25d6-e706-6822-793f12ba2015@linux.microsoft.com>
 <MN2PR02MB68639EE1AC00187FDA3D5A42D47B2@MN2PR02MB6863.namprd02.prod.outlook.com>
 <bb569c87-1a60-c498-98e4-db519e4d7d24@linux.microsoft.com>
Date: Wed, 18 Nov 2026 15:01:44 +0100
Message-ID: <kupwlqagrw7.fsf@vkuznets-thinkpadx1carbongen12.rmtcz.csb>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

Mukesh R <mrathor@linux.microsoft.com> writes:

> On 11/17/26 09:41, Michael Kelley wrote:

...

>
> Confirming, that it is same behavior all the way back to 2016.
>
>> Sounds good. FWIW, old TLFS version 2.0A, which is specifically
>> titled to cover Windows Server 2008 R2, has the paragraph
>> about hypercall continuation. So that functionality was evidently
>> present very early on. It is still curious that Vitaly found it
>> necessary to include the looping behavior in the Linux guest
>> code.
>   
> Maybe Vitaly was running into a genuine bug, not sure.
>

I'm not sure either :-(

WS2012 was definitely around back then, not sure about 2008. It may also
make sense to add at least a debug print in case we find ourselves
running on something that old. AFAICS, even the TLFS version 2.0A
mentions PV TLB flush hypercalls. If looping is still required for these
old versions, we may introduce some very hard-to-find bugs if we drop
it.

-- 
Vitaly

