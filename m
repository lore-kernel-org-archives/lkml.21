Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795416481;
	b=cjs6JZrCMUiejn6a5bG7f+MHo1LF66Crdb2OCq1SdBjVoUS4hI6+j3zrbGJDlUJ7nFKb
	 eAJr4Btc3OZMW2fU4bOuN8aepqdQwlRePbWzwwVrAqPh0HPyug/JwzUo3he1tFJ+b42Zi
	 HIAO17AXHnQX37rd1C/j5IfV/8fjiPVSDshx5j8QeF+JEXxK2ZOWYRGQ2zEJDOW+9TXWB
	 TI6/50Y3X8o2Av34ltS8Sqa+TziI4kGlnuRL0CE64HSJR+71Atkjar2+eD72FgU4Jc5E7
	 JGfMPO2mhg+tJGyUcv0B/mSoc1fR3rnx9NvRFI+vfITzwD+ozvDEIQ+whHu0VuUR1ZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795416481;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Content-Disposition;
	bh=9XAnfSrCk5TAgri3G5kirQJ+1QUBkthXAlw0j/mwUvk=;
	b=TgOJfxQlAIJZmsil1LlsQ5Roxnh65SrmjoUmvC9JwTSEwsVbPkeH/nAfSPzWAK/iRUSH
	 2TFBKEbDaD4t8H2VQaKk9+c3LfcXnVOpzvTFlrYqJZY6bGPb8tLdL0tLv2YJG7zESb7M0
	 +mLgVUSSpNPA+qtfzUSHWqDecBPzcfeV+2Xd7DUBiZtw8h9rMKLi8gFbG0Ed5CpHXDRfy
	 WLiW426WOP4WsVFSTJ17dpvsVYNRQSVraCLNbM+u78opDDeo/LB7MlTt7GbOl7CtgoMA0
	 Od1pZB6F1LviP3wu8bRUA5WowzusFuVRbc2h0dyRrknJvyBMRZrlCP5ALxYFubTIVww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QtcT5jHJ;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id A662A606A32E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:48:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A662A606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QtcT5jHJ
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2f0621eec70so15247435ad.2
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 22:48:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795416480; x=1796021280; darn=vger.kernel.org;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9XAnfSrCk5TAgri3G5kirQJ+1QUBkthXAlw0j/mwUvk=;
        b=QtcT5jHJqWm1+yYAA4VFMUP9cS+spmeKwR5RDKEV3n+c3ftxMf2A+S0r6XtwhfzSkA
         i89BXqck7v1ltIBc4g+zcm6rPOPLJn/WoTGr6fWujJ5HHX37VCCqn+5hkt4UpvPDAyK/
         DzuOh0Appm/d4BWAtNs5xZba9MLv+lEZJLKeuv9+JAAyKr9eFkW+rOMsNjggp1sksr5X
         B2JKTwP7urRGyQVRlhafyhdA2ffZMnmFgkniU7mpAO/qkc49LYqaFAX5hYEglksH7mef
         k7TEeU43ML1MTVqG7C5tNuJ/CESrvVz2mPnzpvEBeefrauZymIXXWJIHNRH3mUgbvMWa
         6S3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795416480; x=1796021280;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9XAnfSrCk5TAgri3G5kirQJ+1QUBkthXAlw0j/mwUvk=;
        b=kzLLxLEnieibpgoKWH8iAtCmBBZGh3wxrx8xhVrI+1YaBee9XaUiXMX/DMW7JkTxkC
         sy1Uki1IDzbdzP+tSMBmE43h3QgRaY6b7WCqqW0QAYCQdUid259gPal5rRF4cCEgQ018
         SVmysBHbBL/Lf2Dm60y6g43t5yMDW0yW3mt4mAH51IG7Z0o9/SUPyzgi8koR8Wj3TROP
         sRcPJsR0qrt6F91I5cBO3hvoqjo9WcZkoCbzGagyUtTDKZq00zqH58Xk2zBbR3sIFF/G
         WciCs2w9nqxflgN3sJl9zU2LnxacXJqHhlisMs5p/yyISnXsnSWoeoejDbdAKdOEDEVE
         lvWA==
X-Forwarded-Encrypted: i=1; AL+hErETJgZ0ols6coHPfVmpezIFCeSkHBc1S1bqBh/TGkkosUZ1cDnrep1TbeCIDKLTtloIuOg1gMeTyuOKHwQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z89xxFQ+MFHMC+ooblG4HI1LL34Rp84HBEtRWBu3myc+9VrCJRn
	NqiGRZwBsDMuhB4lNumdGWt6tAJgjZKxKwufWEbsz7Pl9OpQf3D+Ty6A
X-Gm-Gg: AZFdTZdhHJpUTdfTr5qvwCHxmOYteT4QL/lgeFUJBW6RKmTil8i8hgFWcoj0reMKpAz
	8cj4bb/jvNapPp+iGovrjc1MpK4P4BlJEuXu2mkXPvZHPL/QTHsUa8Z7Ybxlh3cQUONFy63reIK
	D+JVBHkP4MpaAeiOt0lK4vPswIpb9Jwp+vRfGjzYzY+qLIvzleMCX1Aicf9a73Utpc/7NPzs8gZ
	cKo7WuWXQBnYy0RRAuUctxzAAPF1b9CUVJCbi3p0Dne4FiEm38yp+Oxd9ied/byEBpU9R35b5Ce
	DVGjJszyR5+gJHYJsSsX3efSjX1uSk4RY5z5fy4I9B25ye4OAQUtFPb7SpP37k82RG2wy/SsfBy
	95ZLBRsOK92kjRBSFy4cvTA73tTaZ6l6GRIxO4ZN7ttHPlgCj21ZFd5URAOqTw/6jDFQDCb3sdg
	LBAcdrexNHaTenIdGg4yqgA7Pkf1y/Jc/2lHl+/Mx/HYuJL3nwvMeP21xiKEcSD1bHTb64mcXoi
	1yJLN7/AHMEAkW0Phj6KQKwZfh023syIy9vZY3ZhIvRJgEYoJ2aEzg1swdjENDTlgdNkEzv3bfj
	R1O0L5nmOay5k4YbdEZ6RdWBZUxctyQ/W3Tt/ayEgcXk6I6ZwhgjFd0yGXl3AkY8WPiRZg==
X-Received: by 2002:a17:902:ce82:b0:2ef:e9df:2422 with SMTP id d9443c01a7336-2f03f1cf4e6mr103786255ad.16.1795416479999;
        Sun, 22 Nov 2026 22:47:59 -0800 (PST)
Received: from localhost ([2a00:79e0:2ebe:8:4121:d698:201c:9274])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee84364sm48678155ad.5.2026.11.22.22.47.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 22:47:59 -0800 (PST)
Date: Sun, 22 Nov 2026 22:47:58 -0800
Message-ID: <8ee0713aa3e3cb1e54c0a60f1b32cb86@gmail.com>
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Mika Westerberg <westeri@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Corey Minyard <corey@minyard.net>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>,
	linux-i2c@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	openipmi-developer@lists.sourceforge.net,
	platform-driver-x86@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH 8/8] power: supply: sbs-battery: use 4-argument i2c_smbus_read_block_data()
In-Reply-To: <avELD9tlEfl9Uth7@venus>
References: <20261024-i2c-smbus-read-block-data-v1-0-19bb97467982@gmail.com> <20261024-i2c-smbus-read-block-data-v1-8-19bb97467982@gmail.com> <avELD9tlEfl9Uth7@venus>
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
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Sebastian,

On Mon, Nov 09, 2026 at 12:52:18AM +0100, Sebastian Reichel wrote:
> On Sat, Oct 24, 2026 at 07:48:48PM -0700, Dmitry Torokhov wrote:
> > Pass the destination buffer size to sbs_read_string_data(), and pass
> > the buffer capacity reserving space for a trailing NUL terminator to
> > i2c_smbus_read_block_data().
> > 
> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
>
> Acked-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Thank you for the ack. Will you be applying this patch to your tree, or
do you expect me to queue it through mine?

Thanks.

-- 
Dmitry
