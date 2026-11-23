Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795396941;
	b=inRpVAhlteDFGIyLVcii6GUFmVnyJH/1ErpNDMT8g799lr9HYHvdN+41I6sPqZ7kfpRE
	 POC7aCRey7adPc2qkwIFukIAqjhIFCfzWM6fz7P3yG5mmQZSTzutMdSGpUqt9nwQI7jdB
	 MMAr40eUMqj4pAg5FdHmpC488rCrw8PYiPwAMxPRtidhrYpq2xAZxg/pqyRNcBkSHxrXF
	 JTSOccZzXOrZeE6kq6Kt0zVKkgKUPtGJnkjbRRQyqBLW10iRgFaL1uhr3vmy2Klt6w7GG
	 2v3ZfhsiN3rALFnc2vypyqaLFJ+rAeWjWhEiQ6pn7nAue1HOO3bjQrRxGj7+uxwTVKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795396941;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=2Q8qQWgKcP+xT57roRgQ8IJ3xXja0pQGrqCS2TbAAfE=;
	b=cWVryLClsvIcCSFTOh0Wf7FlIXz4u8OfLHqkcWtD4a6IlIE2Cg44mtBWLaYR0QAnaJz1
	 xIRMhCpZjIXXl/P67rkTOArAh4eEqgQBgpoqu0YgHyvDq3/+xashH1mkxt/RaELns5i7r
	 fqF/fmENWVeaepZBByH2n5WBWuHCpXrRtXbIXtigcJPo57OGcLbUHS3jFVIhRvVSyS+WZ
	 IJSCOHQb9zV17YKq8fYE/8e/3azaJ+snK9zi13MVNpih6jVEtXOQWJAQIfOVXhylRv4e3
	 6o5qds4tTE7FlcByqqna6f92xzdAQY8uFqB+PgiO+vZwCSpphpDi/f2Ywv70sgLdlNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rcnD80S6;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA65606A32D
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 01:22:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7AA65606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rcnD80S6
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1b3beeaf6f9so3305572c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 17:22:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795396940; x=1796001740; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2Q8qQWgKcP+xT57roRgQ8IJ3xXja0pQGrqCS2TbAAfE=;
        b=rcnD80S6RHlSfFU8FCgfOc0ABV95p4Il5Ah/CGuObNMNDoi/6q+Szy1oe0iVWlIMoL
         Y/Rbloz1sA1ibz7cbUzYlxer4QwSEaU/Tbdzzq5M+1S/1I5jDzcyw3hmxyTqXJ306W61
         L048QyV6ekg3eBAbQ6i322m6qMqFIgtFb9Qlw4oVGC/FL8BeAWtG49fyAdFRvDWVeRJd
         uuaPN6YzRDDZ4+wOBgkh1W9gZYI4AtnucAMEh1TM+QZKabFMnJk94bTuPsfrN27Vp+rV
         KVC5KxLp2ILW4CluX3r5RTzj9fukwcR9HaTsu6ACUYQZENPCfO3iRFAo/38PeXP6GU3B
         HLhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795396940; x=1796001740;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2Q8qQWgKcP+xT57roRgQ8IJ3xXja0pQGrqCS2TbAAfE=;
        b=Vso1eelBd86KHqZt+ELI/oW4kVpOyXRwUN5kVe7pAmHFHTgNiHOWq9VSid4t9422Vg
         8u4UEwL7RD877hIIbD63kIVIa+UBod7x8tL+7VYnUjbRHYqYB/16eVjYAvWGefoRbI2Z
         QqbI8fNhg+xIr90hT8v2MPzeICnS7JYg/RjWL058VKwjF52udS1cWaw8lcriBY0zJFiw
         o37BK823oZktkB2f0HTkBWOki8nl5/SobrVHzFeMYBTAP5zMyD/A8dDUCSUgujcSIphv
         jM263AQjs9wRRMxR/uDo7t28IOqcHNkdSceo3jVkDxjnnXfBm99s+u+aTqratk8uV+mv
         JMHw==
X-Forwarded-Encrypted: i=1; AL+hErFN3ulrTc33SGNZpPVWdbAJkPJjXV1VxD59MoAikCZ0yeLnWIntpcdWQiuWguJy0SkpJtzEWU/fmksth40=@vger.kernel.org
X-Gm-Message-State: APuU4Z94pg/XclXLMMux59ruAhcUwbrswpEwuHDOey5+i/p4JYTizAEV
	8p+mKwjmr3RcOst+HjjJFynhbqZrIGoq4EvTptNtQWhqW5bl7p6TelgH
X-Gm-Gg: AZFdTZeLKfK+GJplLMJMz5khS10/wXBmCRIPBnoXwzUSB/I/zemYwVulwKJN7Am53dR
	ykSpvk8YPkLJlh/7wjWKNJG9zuUMIjDLap2CxFhwnrHqvTXgthz99KRJO/VjkgZ93kxSYtfJnqu
	I5v0Vx1WOpQQeOii5dACsak+QB8wsroINiyI2La7/rxwp6hIJBalnCvnER4HcE7Ts88qHdUxK90
	4StOCRB/WHLj+LOPpJhruHA1z+djIJRLC2vHJ1BaeYq8q6+++8xH3FufyKV3quRrZYFeTfcunq8
	pmlPjQMEg2w5HgxtD8UsJ9Z7JNFddzc35Zq36x6bQ0vxZrDq2W4YwYPM+b2gm4hCeESkWPQhbds
	X3M1642QK3YuLZlxyaCNVIx6ctazalm+xEg0q8VF7OOPp0mg/OhPZEc/Wd5/DUnQutND1YH11XM
	CsstXv+Y1s3k97nAfCWvPR3439A7fQRgNI79nEqHqB2ui9AIBR4hvbonZZ03gjKLEKQTtRI1PXQ
	Mu96IIaZ3vuET93HHpvV6orhQzPe72xyScW+lM9Obutx7hmaYCh6rJ4BNIzlUYbsj7CZ+UDVIxb
	Ow4I+fV8UvEZdUD5eoTATVmd/kRANFYHWjD73RT/poyQbbNVOagbtFfy+LhvfKid6MMGTBc=
X-Received: by 2002:a05:701a:ccca:20b0:1b5:71bb:6800 with SMTP id a92af1059eb24-1b571bb698bmr1863335c88.3.1795396940552;
        Sun, 22 Nov 2026 17:22:20 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:f002:4621:aeeb:e0e7])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c1142sm22955681c88.2.2026.11.22.17.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 17:22:19 -0800 (PST)
Date: Sun, 22 Nov 2026 17:22:16 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: "Alfred E . Heggestad" <aeh@db.org>, Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <chleroy@kernel.org>
Cc: Oliver Neukum <oneukum@suse.com>, 
	Thomas Reitmayr <treitmayr@devbase.at>, Shaun Jackman <sjackman@gmail.com>, 
	Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>, Florian Euchner <florian.euchner@gmail.com>, 
	Johan Hovold <johan@kernel.org>, Javier Carrasco <javier.carrasco.cruz@gmail.com>, 
	Xue Lei <Xue.Lei@windriver.com>, linux-input@vger.kernel.org, linux-usb@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Input: remove obsolete cm109 USB phone driver
Message-ID: <awOVNaQM8_Hb5E3H@google.com>
References: <20261112001642.243554-1-dmitry.torokhov@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261112001642.243554-1-dmitry.torokhov@gmail.com>

On Wed, Nov 11, 2026 at 04:16:40PM -0800, Dmitry Torokhov wrote:
> This short series removes the obsolete cm109 driver for mid-2000s USB
> VoIP/Skype handsets based on the C-Media CM109 USB audio and HID
> controller (0x0d8c:0x000e) and drops its module selection from
> ppc6xx_defconfig.
> 
> The driver was written in 2007-2008 (modeled after yealink) to poll a
> 4x4 phone keypad matrix and toggle a buzzer wired to the chip's GPIO
> pins across four phone models (Komunikate KIP1000, Genius G-talk,
> Allied-Telesis Corega USBPH01, and ATCom AU-100), relying on a module
> parameter (phone=...) to choose the keymap. The mid-2000s userspace
> VoIP/Skype bridge ecosystem for these handsets is long defunct, and the
> driver has seen no new hardware support since 2008 while continuing to
> attract syzbot crashes in its custom URB state machine.
> 
> Furthermore, because 0x0d8c:0x000e is the generic default C-Media CM109
> VID:PID and was added to hid_ignore_list[] so cm109 could claim the USB
> interface, cm109 actively interferes with non-phone CM109 devices still
> in use today: amateur radio interfaces (Direwolf, AllStarLink, SVXLink,
> UniPager, Hamlib) have to blacklist cm109 so usbhid can expose
> /dev/hidraw* and so opening the input device does not pulse the GPIO
> pins and key the radio transmitter's PTT line, while standard USB
> headsets with 0x0d8c:0x000e can bind to usbhid directly via the chip's
> standard HID Consumer Page volume and mute descriptors once the
> hid_ignore_list[] entry is dropped.
> 
> Thanks.
> 
> Dmitry Torokhov (2):
>   powerpc/configs: drop CONFIG_INPUT_CM109 from ppc6xx_defconfig
>   Input: cm109 - remove driver

Applied the lot.

-- 
Dmitry
