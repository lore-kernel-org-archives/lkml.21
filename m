Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795084110;
	b=V5m4hmUqT9SYfh44xVdGpsKy8xqwVBl2ntDqjOuQzzBK1MqenxYieEB34C86G8x1FA5T
	 2Zbm3Wxnpc5pEtOUe4Ddgx5g3ff5+SHqANHZ37qdaFZinjfOKvaCQd7EmgAupgDlvLfJl
	 NAgY8SIolm+OasAx1pEU9vu8W+/0VsAYj+bkBKyk5/E0JeGpwpz7XxoPTZ+CsAqAxdmMG
	 +Z0ZNXatDxaCEBU/g39xF4xOhOzu6wj3PyYlX8Kb96fUlI8YXk91a/KSDH4km/RrPWUip
	 WRtR+Fj/dXcZDuB6ynjZamJOlPlip4mfkqsUkNwpfKaUPIFD83gbe58gkig0KE8ktBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795084110;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:In-Reply-To:References:Date:
	 Message-ID:MIME-Version:Content-Type;
	bh=67HNtrDIxYfPbX2hk4h6A2Wbx5OSvimWbMoWJ2Xl9qo=;
	b=HJeqFmLG1w4XT7jIGT80luUJo4TcWMen+RNixrX/IHaspEihTegqXhKySc5Xz7soM3q5
	 P0gLNzJhUwONFbF+iPB9qla7YdsmpItWmv0BVcCuR7KMuO3jzacxoMGbqf/h/NrE129jC
	 ozor/ZWIEX9sVqMOnv/Gu01gwczAqy0WJhgk5sBazs+xl0mp0XTOzu80jXrvXIuPOiZ+3
	 ACIr/oWxJvC5Q+sYLnRvOHeffNVHw9gDsw+3qKvSTz3h3tpa48FZTfxr3p7ZPmjlFrCSS
	 qf1eNrw6FccJk2fgOwHMpgrt49DvOQuUYqWUbUDPLkYS0/WXXSzoUeL2XZdQ5btKRJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QCrcTT68;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=FibcjWiN;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E466606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 10:28:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E466606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QCrcTT68;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=FibcjWiN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795084108;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=67HNtrDIxYfPbX2hk4h6A2Wbx5OSvimWbMoWJ2Xl9qo=;
	b=QCrcTT68TTqjtUvmKYhk6j7Yw0FO4FJFUvHwgBqDWoh0OtrK4RYkYW6T0T6kvmfN7r7jDb
	N7dpxOIrW5xlVzpoi11Xna2QmzoSGisv4EYiNwmEVnjerf6OaiEPKtf/PyotFs694nagIy
	0u2Yfd5e9srpYwsRAjFNGg0u0gbdyrg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-265-8IdYKlWXOpGl_f8-TA-57A-1; Thu, 19 Nov 2026 05:28:27 -0500
X-MC-Unique: 8IdYKlWXOpGl_f8-TA-57A-1
X-Mimecast-MFC-AGG-ID: 8IdYKlWXOpGl_f8-TA-57A_1795084106
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-4a799d93bc3so778222f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 02:28:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795084106; x=1795688906; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=67HNtrDIxYfPbX2hk4h6A2Wbx5OSvimWbMoWJ2Xl9qo=;
        b=FibcjWiN3HonGULrcDNFRW249x/7yokoU4798LEzwrfyG9WMlu10c2084uOuBVSk1t
         jQycAy3VZh/bsk56mayYCn6w4Bor0B0wHU/1zXf1qWh8dqf92KvmaQ4+OGkizHODvxCs
         MMayj8ouGDhrfiGiguwsNzysXiCB5jE8bEinYQIkKuS+yW0DITct9sFQpIT+cFA265S5
         Rk+odz3AIiOe8oWCNgJgkT9rfgLV9NlK6LGX90J5xNQaKJeriwWFO9q9yK+qQ0o7/DMR
         pTB4LjcQXeIqbJ0E0zJaLyqeS37FSfwaxNSbbSs2iUXgy3hM3LK6u8q689Ml8QkV0s+6
         QVng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795084106; x=1795688906;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=67HNtrDIxYfPbX2hk4h6A2Wbx5OSvimWbMoWJ2Xl9qo=;
        b=2EC6qUw/fWD04okbdkSobWqPMhWPRiE4reO29I0Qv8hNmI52wnux60T2fo+Zo7fUBg
         9+cLEFOSHFhLTy92V3yxC9WMZ2NgB85n8OcYhbMsmI61wYE2uOdo856U9G19DN+2dhP+
         HKjU/jNpdW/uyHV+FspCycEVc9uRa9Q3NqKly1z4dgbzkX4gpdgTiuZJTA/QngydFbrd
         1kIWLDB9n0iBE9C6ugcaWBiBAzy0u3lSS7dLvpuESFnNJK5ThHJei9Gbzzd7QSp0CzhL
         c7WSSuAGuzZfiiF84J4AO4F2BBfiUHGS6/DAzzErowbGIZuoU5LRqYn4/P1gbfZfG15Z
         HIQQ==
X-Forwarded-Encrypted: i=1; AL+hErFZIbbm8EkbNKa3B6adDtYgvBmbMUqXFkUcyHrnnCxlQI20pzi4ZUX4o+pqkWgtkuM0lb+uVAElk2mKUps=@vger.kernel.org
X-Gm-Message-State: APuU4Z/yuFiQBRwnXxbfZtO48vkpl6/VZEtk2cNRisWl9pYy4EEq48km
	QPARxIlBSFgkJr3zKavWbvjASHMzlMqOpc7B/kEhpj4MBGjWlyqQWKVXFX6LE+cil0JGbz7d8n0
	IGtrqryTGGKNqaIIRh5VmNKk8TBebOBycZ/QM55ck6h2LsrgAR7+qgb5dFExGWtybNg==
X-Gm-Gg: AZFdTZfD95ELMW+JrEd4hbsFRRSuvuZIAg9XHbHz88++46PumxdgH/th0Zv2ITQNqCt
	oRtaLs5zOgTHkhRpnM6J1rkJE5JxzJnz9CwEH+0T6IXP52d4eX9uUjqVO43yqsP1/bLkn7nC+8J
	2nn5LdbO3KDDQYvWjlNvh2HYewRcc2KfhPides34W9gXB6nzrSA2Si9ptr1jV8QUaMqGgvexMxr
	nSw8GndjVe2+bXTwPqqnvAJ4C7NQFuAWwv0eQm5JZJ1RFAp0//tC5gSfacF8xK+CHa+4Th7/l3W
	8c2W3tMBFb3gmUBkYddT7CFgI7ZxXAQh4/9Y7cvEPVdD7ef0rlRPv1p41ems6CKfjRSNKLbUFFz
	RhL9Kl5nw5qXWyMD1VKz9tcvx3X4ea46epbq9zq3PbOyIvA54a7l7HVypJX14Pcihh/StyAuZLP
	sRmQKi8QTkTvAgWrc=
X-Received: by 2002:a05:6000:29c8:b0:49c:192f:cf20 with SMTP id ffacd0b85a97d-4a633a652femr8004628f8f.6.1795084105876;
        Thu, 19 Nov 2026 02:28:25 -0800 (PST)
X-Received: by 2002:a05:6000:29c8:b0:49c:192f:cf20 with SMTP id ffacd0b85a97d-4a633a652femr8004599f8f.6.1795084105479;
        Thu, 19 Nov 2026 02:28:25 -0800 (PST)
Received: from vkuznets-thinkpadx1carbongen12.rmtcz.csb (g3.ign.cz. [91.219.240.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a65609391bsm9979145f8f.36.2026.11.19.02.28.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 02:28:25 -0800 (PST)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Michael Kelley <mhklinux@outlook.com>, Mukesh R
 <mrathor@linux.microsoft.com>, Michael Kelley <mhklinux@outlook.com>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: "haiyangz@microsoft.com" <haiyangz@microsoft.com>, "wei.liu@kernel.org"
 <wei.liu@kernel.org>, "decui@microsoft.com" <decui@microsoft.com>,
 "kameroncarr@linux.microsoft.com" <kameroncarr@linux.microsoft.com>
Subject: RE: [PATCH V1 2/2] Drivers: hv: Fix bugs and issues around repeat
 hypercall
In-Reply-To: <MN2PR02MB6863A95F4A2E10D73BDBFE97D47A2@MN2PR02MB6863.namprd02.prod.outlook.com>
References: <20261114025313.1257042-1-mrathor@linux.microsoft.com>
 <20261114025313.1257042-3-mrathor@linux.microsoft.com>
 <MN2PR02MB6863E6C4F59864B7833681FCD47D2@MN2PR02MB6863.namprd02.prod.outlook.com>
 <fd130973-25d6-e706-6822-793f12ba2015@linux.microsoft.com>
 <MN2PR02MB68639EE1AC00187FDA3D5A42D47B2@MN2PR02MB6863.namprd02.prod.outlook.com>
 <bb569c87-1a60-c498-98e4-db519e4d7d24@linux.microsoft.com>
 <kupwlqagrw7.fsf@vkuznets-thinkpadx1carbongen12.rmtcz.csb>
 <MN2PR02MB6863A95F4A2E10D73BDBFE97D47A2@MN2PR02MB6863.namprd02.prod.outlook.com>
Date: Thu, 19 Nov 2026 11:28:24 +0100
Message-ID: <kupqzghglo7.fsf@vkuznets-thinkpadx1carbongen12.rmtcz.csb>
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

Michael Kelley <mhklinux@outlook.com> writes:

> From: Vitaly Kuznetsov <vkuznets@redhat.com> Sent: Wednesday, November 18, 2026 6:02 AM
>> 
>> Mukesh R <mrathor@linux.microsoft.com> writes:
>> 
>> > On 11/17/26 09:41, Michael Kelley wrote:
>> 
>> ...
>> 
>> > Confirming, that it is same behavior all the way back to 2016.
>> >
>> >> Sounds good. FWIW, old TLFS version 2.0A, which is specifically
>> >> titled to cover Windows Server 2008 R2, has the paragraph
>> >> about hypercall continuation. So that functionality was evidently
>> >> present very early on. It is still curious that Vitaly found it
>> >> necessary to include the looping behavior in the Linux guest
>> >> code.
>> >
>> > Maybe Vitaly was running into a genuine bug, not sure.
>> >
>> 
>> I'm not sure either :-(
>> 
>> WS2012 was definitely around back then, not sure about 2008. It may also
>> make sense to add at least a debug print in case we find ourselves
>> running on something that old. AFAICS, even the TLFS version 2.0A
>> mentions PV TLB flush hypercalls. If looping is still required for these
>> old versions, we may introduce some very hard-to-find bugs if we drop
>> it.
>> 
>
> Vitaly -- I'll point out that support for running Linux guests
> on any Hyper-V older than WS2016/Win10 has been removed
> from the upstream code tree as of 7.4. 

Missed that, thanks for pointing out!

> The removal is
> impactful enough that 7.4 and later kernels won't boot in a
> guest on these older Hyper-V versions. Hopefully whatever bug
> you encountered is no longer present in WS2016 and later. But
> even if the looping is removed, the code could still check and
> warn on a hypercall completion with no error but not all reps
> completed. Then at least we'd know there is a problem.

Yes, WARN[_ON_ONCE]() should be sufficient.

-- 
Vitaly

