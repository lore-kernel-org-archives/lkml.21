Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795399086;
	b=JkkSWBBEmTSy7T3ot7KZxBE92ey1lnRPo3foWNgdiTJLxAcDNI1nX1pnPlQU01AGKi1A
	 jXtiuYFzzjaYcdMX0t+6B4QhWWRW6l5w2iahGDRYy1Y5faaY2FKHwJ2YEdirXboyTR7U0
	 FcsVJegWssu58o7HyRy1P8UUJ+/NXvPaTxXov9hjzA5AA2YZf4ZiSi2fPzO2IlPNIb7rv
	 ZSZGlNEdEceognevDCjzP7UxaLZjwvFu4wayFG0uvqATCk9h4VvVEh37GONtuVvy1/vsc
	 EhBwgqVmUgJYv+V47aXjBcWXttsV1xKvikjSddLUvsJLV4634H0GAKKIOLogk+zFSnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795399086;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=EdnKInqQ5+7MRIlJYl9W6jX0PjWwvTvel1A9zS73Wds=;
	b=EUJyV2C7/eYL50j30zPq5W214tYPHGliO9+lWWQz+eEKFZ356qhZxv5tycd8h4w1tm/k
	 gVGojgUCz2I+UbxMgFeH8J2fdVxtOnHl4xqLjwDxJwRJKuc4I1KcKEde7JBt9rRw1BIr3
	 2A/fDpVKKJJdCHrbaJ1yk6nSr0mQGCzf7/r5kplsFybNdTR0HmaNjskuyneMsAq6X2UsE
	 ufSNBbdtuXdhsxx64+7DYAcXIvyLTUriEuvTNxY8YlScybwwKuJ1HHOlP/mdc7Z8C5PbV
	 1S2SN4ItxWC5S43aH0SZR1V5aOCantY8wLlBU26vr3L97iileWjU5Zeo5RTu3a8Ddtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wz+RRvak;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50127606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 01:58:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50127606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wz+RRvak
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-15ea896ddc8so4673423c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 17:58:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795399085; x=1796003885; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EdnKInqQ5+7MRIlJYl9W6jX0PjWwvTvel1A9zS73Wds=;
        b=Wz+RRvakizev69iTG+bY7/74flDuBNjlVOT/+y6FX/tZxHy/l/uCfoNxRnWOiJDvpI
         zEB0RihQvjw/wtRoDyqgJ3VbwVKS81LhayPczzhlq0GsQ5GkLJj5e5UO5oN6o7Aui97i
         GnHZAk6ihp8JQWDVj7GQLHxppffCN8dc1rwhLZQUI51CWXVT3g/il923TXgMwnqEx49H
         cE2Mir9UB+K7bXPumWL6TEyCSZdIoYhWUL557cA++VgpTrpD+ND3+UC3qIjgs0ysEbfM
         v56Kgv7pNDZqWddcQeHd7WRTCc4PzTrkzLAfByceaeuZBSjgmSkjcVIlrQxffAyIfFiJ
         bIIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795399085; x=1796003885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EdnKInqQ5+7MRIlJYl9W6jX0PjWwvTvel1A9zS73Wds=;
        b=JvEW/ZbS+t0+uU8Drzi6R3xxflqGiLv4zvoc0foH63UdIHNFCaTxXSfg2LqDXb7pkp
         XvLyH5ZG6TsX8Ef8+kj/fbhoUbXB4zhZ+MfWl0Zwe+G81ieJFMiTuIxM00VofpuThj9j
         cXgGUMKjCh2Sl4ID/Yd8rCvGNyXV7KdIVc9gUPi64C4UhTg8E/YG63PP05N/oAk2HReS
         GZB0PzOA3Yl/BOx2Ek0spWJp/BLt8a4/vpCiZeMRufgPh97bRih6JSDi8a9fxKIXby8O
         6mi0PN7o8OAhXQ/31rB+lInGpTk6TEEywYCgDLAFDBryKBfF4rdjoz9k0aL+ztz85rKS
         ogWA==
X-Forwarded-Encrypted: i=1; AL+hErFVyLW913MV3vkTfhyZoWXstJ8zvshR6D6f2u30VBzQBZtRsNLf1CKtGG3CHvvB2FLHNxX0ezUvXRJIHn0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/KyqYdfdZBVcBjLg1IqUPWTN/6HXpjv7wDFS6dd0KqkYmpkRHf
	M+jNxR5VRGcPjXQBdP+W9LelymihY6VCqjhK7Zmf08RTi/OSsQIHH4uM
X-Gm-Gg: AZFdTZdFNwQGZwgWFI5+AyXkXti2WzylShPhGK8MKXY4HVzWWV6PmKA1OzGL48keXYK
	GsoWFzOkvU+N8bQnTrCOc5CGYVZjJm94laaWbgOuuej5ckfuHN1fqgFqc6p92NDjnaDseWUBN4H
	ef1Xkl5kDSxqG0pG4kCB38TsyxGofXcZWzKN2XcMrJ6lflI4qVSZ7Cru6CbgRtnidttnbU/ZmEt
	A/LZbsPIkdgPlfh0nAVanv7jcDo0ri/KKyJv+mObnU5Xwd/efl0awvjGINBJj1M5vyeDoSr5o69
	6c+lrizVFn76Urs7viVDZeles4TF2KrzFD9mOlg6MXAuyWo8vAC1xCFhm2L6fIO8p3y4KBjPofG
	JstNyXcFCdejfaM2ri0ciP7ZJ1ke0nni3b+UnZwMdSEY+2g+E5ExecLGt2X+aUKDZ2OBon2JO7F
	QfBiwHAWFEhOCEKMUXYAYpnaL/wnc6LiGHIWCK0ZGc23OBEKW8zrdyxvwmZslt0P92/sMOaKlHZ
	Jl4LwwABVqjnvGmLx2F9v4YX78imhBbRAkc+zdn5r0dB4ljJJpqDJr+v/xPXKpDlR1Qt5tJ61eZ
	2mnHgfvuKFiNoq1eekoh31O9xUp4rOJoRLqCZ9t73ZLNt5UMTGoPoyBDEIOJc/Qfchz+9kJZQi+
	GFPehHeBfFqw6BI6aWZQh7750jJCH5SCEvjumAFQ9DA3sgVOFli48zogV0eHaOMNz1Po7wMKz
X-Received: by 2002:a05:693c:88c4:20b0:386:b070:6f16 with SMTP id 5a478bee46e88-386b0707080mr1653623eec.21.1795399085419;
        Sun, 22 Nov 2026 17:58:05 -0800 (PST)
Received: from Mac.localdomain (198-27-228-154.fiber.dynamic.sonic.net. [198.27.228.154])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38577214c2dsm29522134eec.17.2026.11.22.17.58.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 22 Nov 2026 17:58:04 -0800 (PST)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org,
	vadim.fedorenko@linux.dev,
	richardcochran@gmail.com,
	andrew+netdev@lunn.ch,
	arkadiusz.kubalewski@intel.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	jiri@resnulli.us,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	pabeni@redhat.com
Subject: Re: [PATCH net 4/4] ptp: ocp: correct the DCF output frequency
Date: Sun, 22 Nov 2026 17:58:02 -0800
Message-ID: <20261122-timecard-common-v4-e0db4ab1aa-r4-ahmadexp@gmail.com>
In-Reply-To: <179538007070.3135.8275620503580456948@kernel.org>
References: <20261118-timecard-common-301f823ddd-4-ahmadexp@gmail.com> <179538007070.3135.8275620503580456948@kernel.org>
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

On Sun, 22 Nov 2026 at 20:41:10 +0000, netdev-bot+sashiko@kernel.org wrote:
> Should the ART input table get the same kind of fix? Commit 09eeb3aecc6c,
> the one in the Fixes: tag, also added this entry to ptp_ocp_art_sma_in[]:
>
> drivers/ptp/ptp_ocp.c:
> static const struct ocp_selector ptp_ocp_art_sma_in[] = {
> 	{ .name = "PPS1",	.value = 0x0001,  .frequency = 1 },
> 	{ .name = "10Mhz",	.value = 0x0008,  .frequency = 1000000 },
> 	{ }
> };
>
> The entry is named "10Mhz" but has a frequency of 1 MHz. The "10Mhz"
> entry in ptp_ocp_art_sma_out[] uses 10000000.

Yes. The v4 series adds a separate fifth patch correcting that
ART input entry to 10000000. Keeping it separate preserves the narrow
DCF correction and its existing review tag.

> On get, ptp_ocp_dpll_frequency_get() reports 1000000 for an ART input
> that selects 0x08. That value is not in the pin's advertised set. Fixed
> pins hit this too, because sma[0].default_fcn is 0x08 ("IN: 10Mhz").
>
> Would it make sense to change that entry to 10000000 in this patch, or
> in a follow-up?

The new regression uses actual ART init/set/get functions and the DPLL
core's supported-frequency and get-before-set functions. It checks a
literal 10000000 Hz request, rejects 1000000, and verifies the fixed 0x08
default. The old source fails; the corrected source passes. These tests
use stubbed hardware operations, not an ART card.

The five-patch v4 series is posted separately to net:
https://lore.kernel.org/r/20261122-timecard-common-v4-e0db4ab1aa-0-ahmadexp@gmail.com

Ahmad
