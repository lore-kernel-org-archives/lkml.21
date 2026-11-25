Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795619536;
	b=bBebWLVqDBLOhwxqanurWc0Q/kxWKTxRMWMMfTL1H0LkH/X02CVp1E7Zf2lPJvwB5JUO
	 Sy3S8oVQeTLzaGrOU4HNDElsXoFpqkZoHtsMzGDIYhiYB1qJJKe0lFFWepIlGR1afZKRi
	 pyias6a4MSBkFkGLNPIBVjBvOlnXjLjAsVWWmaTj1+yxWUNnx1eNVKu1PMqIS8HmsFNi0
	 aYNPgXd0AZ0olh3Au0lOhc8tHG5PjwkDW/5RPQCvDrXjn3ko/vx3GOTzKhAvvxNzpzUAO
	 5F6KwADLrLBcQY1gqhHO4sZA/YDbje1CKKwDk33LlcLknUAvH0Ub5a59yWuchlkhveQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795619536;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=ElgVmBZSI40ArvK7n+gAM2cqYteYpfiSDzMahlW/TpY=;
	b=UokMF4kySdQkT3dsqbU/THdL+TIa0xIVVQzDc4joKz4Gab9qzMjK6Qx2U5QMKaCv5n7D
	 YGTH2GLZrn9awK5XyxLwmwAiBumzBEt9V4Z6s6GDgiJXnGLu9U4tTG4FKGNI+DVFTCZ1w
	 gmIkOSfCURjDZ4r++5eXRl0RWq7FDqk0FjlvlTQS5b31Tm+Z3Y+Sj3pmc30lY1fdMuVi6
	 1C5io9BcytOwhNAOnYnlxxfIT90kFT1cO/AQ3H3WU/T571pOYBhz0FFEB0RdY/yHav7AG
	 eytXGPD7VeFaDzbE1fP6fTGLVoAvZPRcFDNDNTlBo8f1fv8wAc3lVy/TuZyx8dd/jwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="n5/MBIhn";
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD79606A326
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 15:12:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FD79606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n5/MBIhn
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1b3a05f8b5bso7811546c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 07:12:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795619535; x=1796224335; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ElgVmBZSI40ArvK7n+gAM2cqYteYpfiSDzMahlW/TpY=;
        b=n5/MBIhnCL/zVOA4b/c1x6qcbGRbxNI+kGSh4sg5AuoYqgX66GuM/5qxAAePmcoMoV
         osD3sDhJa5TKAF1RlU1uYAerep9tcobEaSKo2BHJL0zaOE0oA2/+NicnVx7unk0eAi+L
         o6e61z/0F5neL7/Uy+NZbmX8gSB4ZLcdw3TZIhof1b0RA0Tw29Xy8LDwYJ7q52IjkFmE
         ykVr4O4PveiSYxZJJDLI0FqrjIaQESglA0qc2+Vu5GJhc3FIK8WSM9gPZqtox2NYTCEg
         YaWdzcXJifRAw9G1KVRRiiPub1FqE8NfnhV+CpmX6Nos276Ym7MgiADCx63dQiqzQ+nI
         2UBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795619535; x=1796224335;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ElgVmBZSI40ArvK7n+gAM2cqYteYpfiSDzMahlW/TpY=;
        b=se4+4XPyK+90ve3UaaN/E7mFXJ1HMdcqDnghSgPwZp/pn0/ZN9d5J8VQHLpqummKMF
         lDw3rGhM5eLRO0I6jyoyKwT6pvWHoKA9+7DKClztdrA5h0vm3TXk1e+h8uAqXAxXqw7f
         6Ny9TCwldknMyFLiwxQuz398ceU4gxDb78k6j+o465esWzkkjeBO1qttEUqaJVs8bq+X
         8gqR1kEnadsYT24aCFVGIWRUSiOdIZ7PqWKwUIEth1XWEF3ba6KC1lhgadHlWWDHl3XX
         3Vrg3JR5Wpv1cRmaTVEqZQ8trmaznh9LSYZZ8WjosmGoxZyLu3bsjbeSYpqNHIDjJTkU
         CzhA==
X-Forwarded-Encrypted: i=1; AL+hErFT+t9lOVS6vlWPqikpC/wZ/u9ldz6H276eJaXoNCVLp97kjd8uFBX++K2/ZT/OpOFaONjJVoJMYgxUuVg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/yqK6hcJziDIk5vKkA1yLjhDg2naMKS3w8Edp/xqKwspe582X9
	goLCfoL2ci/1IHp/+skys+qd4+JBXl2GBN7UmPlF9R8l507UtpMZX4tU/ul8dGL+yMg=
X-Gm-Gg: AZFdTZcVDMHY1o2m1mRzvUn2Pw4Y8SYCbSopWDF7ZUKC1xi2kUxPE6VoUZrdyvHF1hO
	YX7lPv51x18SJfIkHJbUudMfk4ZefCX1qE08iNO5gqb8U2AbVQuV2VaXgJ14C9xBlvHspda8g9G
	VVLIEOA5rGZKRv4qlq0hxMXue2jEXSuKNbIC0i+xBViGbj2MdsizyNUeKLatqHgZMPci2FuNvSo
	GZHGFWDcTsQNTaSEjLYvrRzwMonaGAbiQ87uIDB2OFD7EpLoEi0yCmgCfKgKt8QyyJUKPfmxYjf
	+kVDAUQfEv7fUV4JyYkmD4JgdHVWl1Nm/lcFwFfB2Hctx3sTlwY+fuPDrOayFstC5zARUHXOIgK
	bXJxLntD1P02hXpkkslL/apeLiBFc3YuUGdTUFQmfZfW3Exoj5ZOFMtYkX67g/if9igFDFAGYfX
	LkqBLS2Bbgn3epUp/hOFHC3ozN+6auB7i7Ya6ZRdKOD3DryK3lDR5Xo/XhYQqI3F933uF9fPbvi
	RHvFxVb3G/Mh8kP3PQqBFn+JBJQPJDn8dfPBlBiyel98NrSgggkB8imHTZsTQvgdIsw0NP7dDUx
	fHRVafYT/wzt43S1
X-Received: by 2002:a05:701a:c9c1:10b0:15e:6541:3099 with SMTP id a92af1059eb24-1b55687eb4dmr16271046c88.7.1795619535175;
        Wed, 25 Nov 2026 07:12:15 -0800 (PST)
Received: from arch ([179.255.154.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385f68bc0adsm51090121eec.13.2026.11.25.07.12.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 07:12:14 -0800 (PST)
From: Zheng Shuyang <yhshzh0@gmail.com>
To: =?UTF-8?q?Eren=20=C3=96zen?= <erenozen@protonmail.com>,
	Fuwei Xie <12313607@mail.sustech.edu.cn>
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v3 0/5] platform/x86: huawei-wmi: expose native firmware power profiles
Date: Wed, 25 Nov 2026 23:11:49 +0800
Message-ID: <20261125151211.83173-1-yhshzh0@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <Tf4l0QLSFWfEcunMVtUNowKIhzNRJjmjCYJKXUFzo-5xhOXhZpn-sUEN57KHkDgKanu1FrS-JHBYcI3K7Mjv176Tg0kMQ4QPIUoEcsYKQig=@protonmail.com>
References: <4F34E5193B4633F6+20261124172651.37716-1-12313607@mail.sustech.edu.cn> <Tf4l0QLSFWfEcunMVtUNowKIhzNRJjmjCYJKXUFzo-5xhOXhZpn-sUEN57KHkDgKanu1FrS-JHBYcI3K7Mjv176Tg0kMQ4QPIUoEcsYKQig=@protonmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Eren and Fuwei,

On Wed, Nov 25, 2026 at 08:17:27AM +0000, Eren Özen wrote:
> Zheng, did your s2idle test on FMB-P start in performance mode?

Yes, my earlier v2 s2idle test started in performance mode. I just ran
dedicated s2idle and fast-write checks on FMB-P (BIOS 1.16, Arch
7.3.5-arch1-1) with power-profiles-daemon stopped, on both unmodified v3
and v3 with your two changes folded in:

Unmodified RFC v3:
- s2idle starting in performance (plugged in, ~9 s): on resume, FMB-P
  preserved performance (cached=performance, GTUB=1, ODVP2=1). Unlike
  CREM-WXX9, BIOS 1.16 does not clear Turbo across a plugged-in s2idle.
- s2idle starting in performance with AC unplugged during sleep (~11 s):
  on wake (AC=0), cached platform_profile, GTUB, and ODVP all matched
  balanced (GTUB=0, ODVP1=1).
- Fast writes (6 rounds x 50 balanced/performance pairs, alternating
  final mode): 0/6 stale rounds (cached == GTUB after every round).

RFC v3 + both of your changes (method resume sync + 0x2a0/0x2a1 using
huawei_wmi_profile_sync()):
- Built with W=1 without warnings.
- Fast writes (same 6 x 50 pairs): 0/6 stale rounds.
- Fn+P and s2idle starting in performance (~7 s) kept cached
  platform_profile, GTUB, and ODVP in sync with no kernel warnings, and
  module unload/reload was clean.

So on FMB-P, \GTUB is already updated by the time 0x2a0/0x2a1 arrives,
and both of your changes work cleanly here without regressions.

Note: Gemini helped with the test scripts and drafting this report; I
performed the physical steps on the machine and verified the results.

Thanks,
Zheng Shuyang
