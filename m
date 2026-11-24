Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795504422;
	b=19gqZFjPdyVxjqskVXtMfVTO5kVrSZdJgD6qmV+0qPdwWZZAMpzeLAkIyl9OKZ0/XMyp
	 8hLy9nSvF+EwHlEsoDckacmhKrqiNWA8KPGnFLVwADpjq90JQSMYueDWKdTGO32bwXbR/
	 f82IP989LdT1ZXtIkvwnWHL/eyISqx09HFxYfL2rrVwoJd82WZttuKNnzXVHlIdOMcMEa
	 RbEmq1jELBOtOGYJfYowH9h4aPgNHRq+EWKa0D2dN5QFDU1E0Ged8YBMJg3vtZGYxAq5d
	 KuI4gY6Lpkz7pkw4sYLSAsjN6OmfA30A9EyC59H6arFAZo7OjGEvX9Mk6PKcQVRhR8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795504422;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Oc2Ja2JUG5wbQDezjA0JUnZUWQF9I7pDq5BAs+s6d6I=;
	b=TSInYkpHl7GU/CdgCIAum/GZnmv0JPgT9atqAxeJuoYU9iuW/ddDD/TIFIQeoS8dxmNC
	 pWZhvp0PLYkFNoPQgJZ/hoT/WZjtMNcWTI3nIyCKscQnlOjmcG462OukdeOldscbHJXye
	 BgfMDdOh6bu8bn9ZTrHUX2xsi1f8NJKcfwNASdNdPXjyVRu03B4bJdZlzXD7Q2at2OzJ1
	 Ak5Y0Wxs5jpeUGNyhVYWi53jmnFhv1ULUzxbN3YgHE0/dpOuNiXoDj/lTGXvSS0owROHc
	 yoKClxM57toBqlpS8aozf28KZzJmPH3EvXSLTvFjLxvbZMo/djqiBBMeUzfz9KXbLZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kalp+CyM;
	arc=none smtp.remote-ip=209.85.215.173
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A888606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 07:13:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A888606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kalp+CyM
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cdb1199bfd8so1888654a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 23:13:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795504420; x=1796109220; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Oc2Ja2JUG5wbQDezjA0JUnZUWQF9I7pDq5BAs+s6d6I=;
        b=kalp+CyMZbk28V1CAWfask1PI+LtBLcDCm4Taq1wYbpn9GWr9UDoi/PKaFFdrz9fqI
         M/1I3aP4arxnk3vBp8XZRna+NRwcu95K0CtVPZU1fYQBc9Kx6Nt8Rsx54EN+3wJobgn2
         NDVnUxxNTYdeJlkqO8Rd8eRy5rKmD/NMVBwVgdaDTp67kTC6E4RI3epMT0k6DlNFVr4Z
         SW5YaABGBZyHs+i4+85oArUoasC/UTUoF8W6kNfKLL+6zefwFrQcmdTHiZvLg5/s34rW
         9fWRdLzt/FVzakR0CiJUVRgX7w/uxE5qn0mRCCIia0tYeAFiEQG3HHzB+mODn1eK/5T9
         3JtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795504420; x=1796109220;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Oc2Ja2JUG5wbQDezjA0JUnZUWQF9I7pDq5BAs+s6d6I=;
        b=OOzUBS/epDYCrC2P2dHDSr4vGs6eBTVCp5C0ORZmjlP/lmrWKs1UYTAteG2ZV55ef1
         ou2LeTX5XRlVia4jwuFH1DjR4RuFhYeFPdbCwCIRA1rOV0+GYvR3sjNLutM6aPImzgzy
         kOG7NNWUNX+NCD9T4Abv5utB/NYJvXafiP30DBEVbU4SZ/s1qQPWsAnuJaxhq+u0JTXT
         IpceVjVoDPM0F65lvT56J6efG2EiCePQlOq77GiNcL6jg7h/RwKsXa83JLAwY6hj+PBG
         JNYRqb58pH3ehb3nlp96cOWP3hsZtab1yK6K59en4xpDqpZv+d9lsOSvS2eFdGs6jO0Z
         HkuA==
X-Forwarded-Encrypted: i=1; AL+hErFudnFX1EL1RF59I8qTjdVg3B141+5UEFFMJYW5EUCaABG11tdB0zwUL4Faf2+tfuVDhxg1wjNIC2oAcxI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+beGTx4KX+xHb6b9hkdZY0N//55RbNFh+eCsLKvAL7ksElX35Q
	0q6JeMbU48RhKcF+x4DL/ypbPNXWwTSKpER8/nqxYChsfJQF9tiUJm4z
X-Gm-Gg: AZFdTZcqAE29rRTtOP62Ke1ZFnKcvyzCgBVMZNEGCF2HxB+z+SzbMx78eVqWdgIPy8Y
	QfdJSb/Q9gdkMLM/UZTp8EXvtfxyUnVl0oQWJ4swI7CdpKMe6Fnz4jSQd4mvf49R0roht2qFEOZ
	MbEdAM5vvb561kkL3dUcwR3e3nuIRWGHBe//n6onfayheX9Ytjss3+5NJS+03yytg+WV0qrL6b/
	EZIi3R6wFhTd2cdxa66cq20FDkutRkDeckgqnRMI+TAVd9FxwbWRE0zWza7pysOW1kDTcBhMiWQ
	GCCsCBWWvPfeP14qXZhW2d1eG2D6mY0gSJGrUKhn9xXfQNnM6MImSwlNPu12/Cz9LLj62MXY4/I
	XeJvUQIP6Xg7ZkIHEGISPsQzER/20AhDPEUgI6w2x7ySN9HOFjMaktqnwoNzde9FipYA8XpDZ3k
	sf+eXVrc8D0P5X1xd4WfeqqJ7u7Zv+liPvC5p5+CLdMnWgk00thadyka8XKg668+UcX5q5MyZ+X
	JMvXYtxSqBJtiFqN6oQfqDN9rx4sBgio/PgG7WHWcsRM2dNu6ZUYHq5omQXjBFpbX5coSdffAcs
	9f5h2TfW8b/NbulcfXFk
X-Received: by 2002:a17:90b:17cd:b0:3ae:6fda:78b1 with SMTP id 98e67ed59e1d1-3b41c95b6bcmr12189973a91.43.1795504420433;
        Mon, 23 Nov 2026 23:13:40 -0800 (PST)
Received: from fedora ([103.156.164.95])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f1276c5sm68236315ad.67.2026.11.23.23.13.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 23:13:39 -0800 (PST)
From: Mulky Fauzan <qapkyy3@gmail.com>
To: qapkyy3@gmail.com
Cc: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	jlee@suse.com,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH] platform/x86: acer-wmi: Add support for Acer Nitro ANV16-71
Date: Tue, 24 Nov 2026 14:12:58 +0700
Message-ID: <20261124071258.31780-1-qapkyy3@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123155520.121595-1-qapkyy3@gmail.com>
References: <20261123155520.121595-1-qapkyy3@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

I did some additional testing of this patch on an Acer Nitro
ANV16-71 (BIOS v1.09) running Fedora with Linux
7.3.4-300.fc45.x86_64, with the patched acer-wmi built as an
out-of-tree module. This is in addition to my earlier testing on
7.4-rc4. I verified the exposed interfaces down to the WMI and EC
register level.

DMI and driver load:
 - The DMI product name matches "Nitro ANV16-71" and acer-wmi loads
   without any ACPI/WMI errors.

Hardware monitoring and manual PWM fan control:
 - CPU (fan1_input) and GPU (fan2_input) speeds are reported correctly.
 - Manual control (pwm1_enable=1 / pwm2_enable=1) works independently
   for both fans and returns to automatic control with =2.

Platform profiles (WMI and EC verification):
 - All five profiles (low-power, quiet, balanced,
   balanced-performance, performance) are accepted by the firmware via
   WMI method 22 (SetGamingMiscSetting, index 0x0b) with status 0x00,
   including performance (turbo). WMI calls were traced with bpftrace.
 - Reading the EC (read-only, via ec_sys), the thermal profile
   register 0x2C updates consistently:
     quiet                -> 0x00
     balanced             -> 0x01
     balanced-performance -> 0x04
     performance          -> 0x05
     low-power            -> 0x06

Tested-by: Mulky Fauzan <qapkyy3@gmail.com>

Thanks,
Mulky Fauzan
