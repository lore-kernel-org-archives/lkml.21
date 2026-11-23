Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795439880;
	b=iNLSYpeK9nz85cNy/VkdnLvHz0aqAYC30/dGJ3iMBeG8eG+UJXCO7HMDK/O5EbWoqFj+
	 JmWBwAxLqA0AmjDq3IiDeVH6jnFVMcNsUCmi+H5IAk1+4BKyrKl4z2dsM/ofFOerKSrBQ
	 +WPkzNXtq/a6sdZ1a4U/VQdo2xw+r1C1DfGFg9S8JIS8bK35Rd/CiVT4DuYYFHWrk/5Jk
	 pLy9k0s6XiZCciyETmjSYsdvZ5xjxZZvIsaZkb/tF581g1vviBCtF4U4hTHIo31Rs755B
	 fewmS/TzyckViQHsWzTje+0a8g9gl4qvrrDTI1x2QndphhTZHbie6tBNgbDT3Jk5CFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795439880;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=3OjYQ6M/mHPxju3Ug4nqhzHldYVWjqYGeM/WmXgESP8=;
	b=k0XnEmyx/k8lXAfX6k04Cp866r37M7KfZKmjKKooWWdxKw2IB8MNMgBYyTSf9r6dYPUy
	 2R2qIZFGs5S93hWr77SqrWoXMKuL0bSJL3p1vS85hl3tll1cXE78ffHhwwCQHbp6Rgyet
	 gcMGh+ogjgtY7Vl8zBSiJKSBvg65nH6vy2XWBaPcrH8UDPGTR805Adr3v/X+r3efG3woN
	 C0ZKVWKtmBFJHtN+NCvNLVGi0vSQFrmIe8iO1S6Zt+Di5q+QMJNCN8dN+tdIxIDnrQeMW
	 +Aq6EZwuHm4fb0OaK7wQYwvveftQVJR2K5pxjSKkvVkCddn/zIbXCbw1qGg4mjT7e0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="GBCxiP/V";
	arc=none smtp.remote-ip=209.85.210.177
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB29606A321
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 13:17:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDB29606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GBCxiP/V
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8a60f90a924so1175319b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 05:17:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795439879; x=1796044679; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3OjYQ6M/mHPxju3Ug4nqhzHldYVWjqYGeM/WmXgESP8=;
        b=GBCxiP/Vin7E39F9175BR+9FM1bK5oF8SIE751dacjqD5EZek72UDTqSMvDsXVg0C3
         SVq12/gm9+LYq5JaHQ0qr1vsed9EXIbRcY61/q03UyoQIQZ2U2LANVC2L+nImryxPUWq
         guokyhzQTvNvhk2YXAOWgGBQpeMm1bLqcMMylqFuNcWu4w74hYfoFxBbokZLxD1ectN1
         cM/bOjuRmglmBQutREyGOyk0U8yA2TigX5BD+Pw/MWxMkSPN077GfOnJFxwtV+w7eY6m
         w/nGCzB+kmT14BWolxiKQ4Yxn3uzXqzIvX0aInYFQMn9Y8BqlJgVFjBJop0qKWAWoXI+
         6rmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795439879; x=1796044679;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3OjYQ6M/mHPxju3Ug4nqhzHldYVWjqYGeM/WmXgESP8=;
        b=zKRoYKvj4Vm33of6OX97B12eicMyJaz1aqaBXOctaiHA1sJYF7LDTCeKmRE57nECX/
         tg1WlEK7A+hdvcIiALNaiIuVD1jMhDi4rSS+GI+lcNqDxumkh+vWOhjylwC8fTbG8hcl
         kJ+pG84yFp4Wc9yupxowRdeBn6rs+UhzJBV3O1VO0JhTbWIfGnxuFxXOnYCxyn99kUQK
         6LvnmMzh3prhj6ydOsSqXDK/IcZEFY8X8FsGs0XJ6msNfhzm3k7sUzPFrOeWquJlbGx+
         u3S4GI0GUSKy4KDO3Ef6bKPWuxzS3DHcZnG3aANcKeCOVWh0764BuRivUMqsjuotouvV
         907g==
X-Forwarded-Encrypted: i=1; AL+hErEMSzQ68CPnilh+lrbzqWXR5SiVg+/5PdjNM7TDWE+u8Ac71Mki1ZKYkeTS1Pjm8ZAD5txjSfkkjdmI/8E=@vger.kernel.org
X-Gm-Message-State: APuU4Z/3NqaPWZMhYrgDrdatVZ2i2qcbUrrriGiQWrqwi4ugnSUmF/Jv
	JSq1b1slpfal5fifM1xAu3MrLStfMNb8Wm4m0LUeW9o3J6cCMzIIgia1
X-Gm-Gg: AZFdTZecZV3LiXqtRA+akM4X3XxFKOfuMjasT13q7oilVxkk0S+40dgQlcnZbO0WyDQ
	khY2XaRuI2G+Xc/jddg6DPb5WnjSgBzvSgqipmarGzXYl6zNQ8a+HXDQBkI5pm60iotg1mkodxZ
	A4bK4cPt2kxTS6h6gMhUsL4NQsbO7OaZunAgH9iLOXKkwSLs7twXVlajq2PVnm5PZE1BZ4L/o6v
	Yj6zl793HIaCJXgmwPApxeuyii5O/M/7ChjoqJgd+sTk5H4zj48Ng7KByWgvyXj2K7m0yWSn4Zl
	+Kb7QUAOCF51gUPDFjYhHKTHwUpTGbzBDrpAWtb+Reo3O8Y2lNqMmiatY++qDtXVNbMuL5CSy8j
	nbEhhsXMCmvrlWXH2WVuS//cC9pkorsgDdB37zlLNXBH27xK7K7kvE72wXnCsUAXjvJ03AP0gGM
	LHKYMDGzem2TYSAEPcpX3kSyCo4dkNPTuAHlNDCnqs4ptnmH1vbx1kdMsme8VBnZMKKGCDcWZvq
	4F/8Xt6jfyx932XIriHux/p5B2Z23ZaT8HLVzljkxm1G+STMmhi3EvXn3GfODAXK/zHpFDbGsp6
	KSq03JXp00qhTrRp1gDaGM9m8HSvz05iS1DYFbFWCNC+11tWrcUBJaVaAfcOke0kngfjie19aVU
	kGtScV7S1QSN9ZDSnGlFtg+C8Gk3tLw7JGGK+mLWPeGmwwQVtgX7neOxXRjfGQk8ecRoXANAZyk
	kdy/TcYMYj5/g8lEcJDiT/mqI/z3lPB2zofSZVvk7AtQ==
X-Received: by 2002:a05:6a20:7346:b0:3e2:86b6:9bf4 with SMTP id adf61e73a8af0-4014ae7ca84mr11666681637.14.1795439879025;
        Mon, 23 Nov 2026 05:17:59 -0800 (PST)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c873b27900sm5605698b3a.47.2026.11.23.05.17.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:17:58 -0800 (PST)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: jic23@kernel.org,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	gwendal@chromium.org,
	swboyd@chromium.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/6] iio: proximity: sx9324: reject negative hysteresis values
Date: Mon, 23 Nov 2026 18:47:48 +0530
Message-ID: <20261123131748.16791-2-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <awQg6X1ay0zyyyaf@ashevche-desk.local>
References: <20261122074649.239441-1-kapoorarnav43@gmail.com> <20261122074649.239441-4-kapoorarnav43@gmail.com> <awQgWmI3HmyqTcrS@ashevche-desk.local> <awQg6X1ay0zyyyaf@ashevche-desk.local>
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

On Mon, Nov 23, 2026 at 01:18:01PM +0200, Andy Shevchenko wrote:
> On Mon, Nov 23, 2026 at 01:15:42PM +0200, Andy Shevchenko wrote:

...

> > 	val = _val;
> > 	if (val > INT_MAX)
> > 		return -EINVAL;
>
> On the second thought, the original < 0 check might be cleaner... Dunno.
> Jonathan, what do you think?

I'd also keep the _val < 0 check. It tests the value as userspace
wrote it, before the conversion, so it needs no comment explaining why
INT_MAX is the limit. But I'm happy to switch to val > INT_MAX in all
four patches if Jonathan prefers that.

Thanks,
Arnav
