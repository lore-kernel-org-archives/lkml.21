Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795136746;
	b=uyZMh0j4+5mCmjgz1k7wWkj+pd7InrWEZt5CCqGcSjK+p7+By2HTRwVbvQEJSV+ULKq4
	 OTT193pICumFSiQo3zV/UUkVg2XbKwUpNGnJ7kZFOl/cFiLerBlcnPnNaqT2ltjD2FaQY
	 hnSv2VHh1WLexai/mQKgjARhi+enDkFcmAD5wHvhbuXiWsPXKFi9cmBw7M334D5Z8yx2Q
	 bjp98JLkO4x7UPbrlM0o88+cmIZGo21Dn0feaGcF9RC997MbJG1YhcuFELYjpQze0mwsD
	 tuIb/Wg1tp9mIwJwcKvhEg1L4Qw7kanXI/EXJ4CJ/r/FPELj2qHO2b4ndQt6s+ipUDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795136746;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=OpzooKDHNgCiysUKol+Ja6SYQLhEkHVY1LVwsqINVmM=;
	b=nm9vwaBtUPocyn9QAk7+lTbq/RQqyHsM2cdSdkoRNP6LyO3iI43tRsWWWIo2cLc4WcXK
	 w8bexiIaYTySMFtn/RRJOQmLUDykdsvHmadeJNQ3M+nO8FPw+S4XjnZicgUORLHuYYziW
	 GgDhSYvoyM4wRZ8Yn9hIV15yu7yaAu6+Cm00uL3mnKrdYV4bkBI8Jao3vJy+0rUerocHg
	 RcvdyBkDgwYVBNjpO9Lcyfk2ML8PzXjwvMtmmNoaVbhOy/nf+ee7KxnE4yYM5aRWDqP4D
	 gr7lcgutYIoyww5ddgfCeLbPTHgdN0HmvFyO++FLsX2xlr72crjm2VF/VgOL+dDWVmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IUWp6nVD;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38253606A325
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 01:05:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38253606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IUWp6nVD
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1a3c08d6928so516786c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 17:05:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795136745; x=1795741545; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OpzooKDHNgCiysUKol+Ja6SYQLhEkHVY1LVwsqINVmM=;
        b=IUWp6nVDYBX5bW+ppvRphFePfE+SGvSsGg3yM4B+6k/G7yBH9MY1k94ICPKtn+3B90
         QjL4IonBDVBiz/loGfjoUoIpQvoKlJeHBogHrNhgnYIdwKJwTWLZLTdvM5SAG1NEEJlt
         eC23OT+IjWbnP5D3r2Tv2/IFBlM4L8KIO+BPGT+f+UwnPGH7dIIL+mkUkBppA5wNyZuj
         hJ5ZQRXYEubO0gObZR2BdirJGm0ZAO4THy/Pff4oE/KfwF9/L3NnxjcUBv47sITYqd64
         yVmWuyEd0wlFrF+ZRddyW8YpBFTnGFlPYHlAlR6aS0p+X5+vzDWBcTdIAGRZcYeTlVKH
         K92Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795136745; x=1795741545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OpzooKDHNgCiysUKol+Ja6SYQLhEkHVY1LVwsqINVmM=;
        b=SP7oXhDWI1fNpq56GRBVKJKH83Y1Gz0+ItRBvlmAQE2vRvBhxET5sk+U6103hwxWXK
         WkZimeaWtSUBSDAAr4g82TU8mq5YtI7rJ1aLPff6VwCNvGogB97hh2kaTwicXUHrVJQv
         kHkvXnHKT03Cop2faumz7jUc3/aji7mFkeZhYSu/iwc5mZpbO+wT1ZDAcgPXhKCaaPNU
         oiWgPgfHTapngHfP9FqaEPNgSDKRrFDEcQV6ywnmqcn/3RZ1GIcUWUkeJdnkvH4ci1a8
         LDCyk31VZ+qp5FVTU1Edfqb1TMSfWsEns35vRJvXRBtpibRO7JAtAzrhOEMLzos85jW0
         5h9A==
X-Forwarded-Encrypted: i=1; AL+hErEGggZ9aQxqav5/rLWq4/rRoEz03PGm99RIM89DpQchtwBo442eljpYqsVLUQH9XY2/WHuPtr6XD3Mj1L0=@vger.kernel.org
X-Gm-Message-State: APuU4Z84b9P/vSM3iURqQ0GU8l7SopTw26aqXB/VfV7pE9yMsbCEyrTk
	vYa55qpDHRbhSpcHlXbzQupXIME0SblMORuZTgdV0RRQLTbAbyTDmP4=
X-Gm-Gg: AYBFou3AKcbMEmDxd+E6Tkbyj9+I6UhWLxnnES8jus17fhHGAx8JGnKCLZshGBlgCaV
	KBoiX/zziSXNPlOb2rqy7e1UPkP7XL5sydAXyQqXO4wzPdAcNLhqy+cwPvjqGElgTWdHLYjXzMU
	cNR8fVvSm+W8QPzbg4+iY3YcMic2CdIdHxH6QTDhtYyo2bJW1xO25I1QLBf2GF0rAuPgwoBV7z/
	0sArqAWg3ydm1fnVVPHHKFLxfXMNZFYOk+Jhua05KXTarNbFC039ieWzc0dbHFH5++xN9HRai7F
	YKd7WXk4sgYP3rfxfr8i+CpewMEYXVtlGqKz0eMcrH3baRI1N5+z0MLDl4QBqPLpoQb34EvvOjQ
	60teCNIWLxcrHkQpM4xF+vZlwVRHP0Dc1tQ/ryiukEShO5GHEaaii98z8Pjc52aUePagVUIHUU/
	ZTJrf/o16j4GQD/A2ka/Egb03nuRzn9KhCi7fPZ/5LShafGEarvqmYjNTgJGwTSCpC0J8aCmgj1
	aKDJcQGlLAY1uuQ6C4+Fh7ZZYcKtzGKaG6VbCyxpCyM14u8Dz5cHlFwVLkANWJocHO7gAzzB9Og
	RNCctLdf7awK6wBftMNvMrQv3vHghO3TPNXGFFyi0h/tjGH7UZYuWs1Oxrtxdw==
X-Received: by 2002:a05:701b:2604:b0:1a3:dbb2:478a with SMTP id a92af1059eb24-1b5568b9037mr1336710c88.27.1795136745320;
        Thu, 19 Nov 2026 17:05:45 -0800 (PST)
Received: from at-Standard-PC-Q35-ICH9-2009 ([27.60.23.101])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55682d301sm2292732c88.10.2026.11.19.17.05.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 17:05:44 -0800 (PST)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: lukas@wunner.de
Cc: atharvatiwarilinuxdev@gmail.com,
	bhelgaas@google.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	hpa@zytor.com,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	mingo@redhat.com,
	tglx@kernel.org,
	x86@kernel.org
Subject: Re: [PATCH] PCI: Add quirk to mask ACSViol on XHCI on iMac20,1 And iMac20,2
Date: Thu, 19 Nov 2026 20:05:36 -0500
Message-ID: <20261120010536.1182-1-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <avrfAD_puIZm1yR1@wunner.de>
References: <avrfAD_puIZm1yR1@wunner.de>
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

> See this discussion:
> 
> https://lore.kernel.org/r/CAL0aDZ_HOq1Sof90GJoBDzPo7Gmr7P_rSnYJaN75QH4K+iodpw@mail.gmail.com/
> 
> It's an LTR message with a zero Requester ID.  This needs to be fixed
> more generically, not with a model-specific quirk.
> 
> Thanks,
> 
> Lukas

I also did not really like the patch tbh. it is now obsolete however
the problem was in the thunderbolt controller, we are basically done
fixing thunderbolt (all apple systems from alpine ridge to icelake)
you can see the code here if you want to:

https://github.com/kaiT2en/KaiT2en-Fedora/blob/main/patches/runtime/thunderbolt/0001-thunderbolt-add-Titan-Ridge-and-Ice-Lake-RTD3-on-Apple-T2-Macs.patch

(this is not complete, some acpi methods like TRPE and SXFP are missing, we
are trying to add that, and the code should be done)

Thanks,

Atharva
