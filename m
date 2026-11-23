Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795465533;
	b=ElCyAfGUAJ1IJjbDvatrPgF5keZmEn5GidMv9pv+5/g7B9pXJr+8xyq9sqkJrKF3Wp0R
	 sWupaixk7gjihhgrezamZyyTQGCZwprj7wjzVyFuZ4aiuHxSNKEtgYe7e9SQf2/DhPsAA
	 /W/15CubAC30/9aXZMeFCHZ+wIoXthSikzniY0wBedt6qoUswO9R0OTZwAJ85PCRYf8jv
	 szXlWLynfgcCrw4WcrnjrWxtL8r5P7xxhJWBRCeibqiDY9FCS6DvOzEjlm0fq39dAl0Hr
	 EzBFVmr1w04eV/xmyRDNCOmOUelFVORbpc3QZBHVrb0SodcAn3VJGvJLUuFBSHq2AOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795465533;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=3VcpHnSiwyTeiDddBV3SmBxGPQ1li3vFXIux+h2TFxk=;
	b=Semcnnb+i2CioXdAHHDn+I03adKyAVY/FFAHGz+ZGQHFT7uQmAugPF5a/VIWB6r2G17c
	 Ehynn74P1MTBiiEmsXgGUvTCxRfPFUNEGG75S5rilZnVmso89VItJwzQdMnTKXnf3sWCN
	 m5d5a4G8cpCcHIOuc3YClRRYPVBixxYaRVyZ+CsSBSL+b+gVoJnJMd3V38rRDxIs+/Pk+
	 bpBBvAbhwFpcWeSJTiPY8ndcnyO1C/IHV8P4Tmr2m+SaehSCeZaFi1IeMR6oqCoYn2MRy
	 O1nnpMyQopTdrE2wxDaP0paY/NaH7ICrPS2vVcttHK28I4Ox94lTvUg1tVfiGvRH56g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WCd6gmjn;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F80606A326
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 20:25:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4F80606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WCd6gmjn
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1b3a05f8b5bso4727238c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 12:25:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795465532; x=1796070332; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3VcpHnSiwyTeiDddBV3SmBxGPQ1li3vFXIux+h2TFxk=;
        b=WCd6gmjncxMKRkd3iKSikeE3vcvosLDXqXyReoAZrp6OZ4q2WT8+0IcqcC6y0DBGnK
         Z/qPmKd3p7srywRjuTHqBTPm8wHoCQqGrGMP3tiQFsED0ZnQmO2w5ggdMmOqJnaKA1Jx
         dzPYRhXIXslkbw7j8nS0MqG6ExvbF0rpiQi+u4Acp5jjPSCm1LsV7Sq2cWd3DgXN2jvY
         11FqIOt5eHTARvp4KmADAMrXyHWBX67qEzNn5eVvz8+uSyeAJCE/J200NSoJtSqgvjZ3
         dE/K8YQpTCLaYSaKa+Jg2F6mrpdTitmcWKIn0812wjnhPAGL5aAjGTEyLpbI5bMnBfqy
         JaDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795465532; x=1796070332;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3VcpHnSiwyTeiDddBV3SmBxGPQ1li3vFXIux+h2TFxk=;
        b=ygCTWswuPwkA0+83PFPckwfo7Qjzsrt0HhbEgINR5fgaakfYTmkZG11DEkaffLgsOQ
         W4iCU3cw7KaQyuNPfOp5gt8uJgJBplVqvOoXm5hcvgdwh+HG2SanI+HTZ1PEKOKCTBvr
         iii/lL9M0DXIrOfX8O75s2gMdgvn1SCw7dGg0erW4nUyr/9fsREBHR4sIGfqQU1oYBhr
         9ahl2AKXLcjJI93NPwqnlMX8yqqDs2yP+fMc+rPtIu+6rbYgzxPxDv5CeSxexWqusIkk
         +ukWiObx+gWc0zjYTy+8seYX5Weyrc4/E7KjB4gPREbs/a1XPjLgL8GEOxf3eMZ7/J+I
         axkw==
X-Forwarded-Encrypted: i=1; AL+hErEgS82mY8egG5b4duZG2123gtdRqU7dknrxEgo6uQJDZzRKfXWl1vDMScoWP3gQ5xx14buYCqZyC6ZCc3g=@vger.kernel.org
X-Gm-Message-State: APuU4Z8P9Vt2yfVJGOjmbfyLEVQLhocCZzoT67TnWbmTwhAr30JXogxY
	gPcifpx6muAxN+6mPibf8n9Od7aD/X3QeRR52ad4vMwcIuq23RSLTY2h
X-Gm-Gg: AZFdTZdOjzDyxflYL4yYuEetKC5WfRg8XhcC48TDBaJWwtSjkpfhfV1E+jYFyjzWfK5
	vu5w+nSSKo7mZOrBDNmeQRkQqqL3c/LYq0R7A35SvSuWr842qM+8h+BlYBVf6ARutsOVleU+cVs
	0K+f4VdAqcfZ4uuoCjana1E9inqt1H3dmpctz9VhP3PzpY0/aqjxxe8m6A5LD0dUMGs/UPt4vyv
	OLbR26pKmoG7D6SMCcynPPT/lIyawLlgyjtmLeXXwD0hLed+tXSeqdwrXxIyhcEH5wkAaLC4C3u
	K+biwCUPl3Zsh92w1ffwns4EAfrbSRxWG8Ab6zEtqJ0uCZzms/5upxhFTlXuhwGTgvCUqaKuA0f
	NjHFjaotusP8J19GmnIt/t6Ik2Wz2QkmVQ2xwrcwifOy29JSFioVmL+KuGpHVhu/12Vkd9fnxlO
	3E0YlZPqnMCl7oTMrQr6c6Yqqx+FmDZuG0whwyZQRN+//1TGipx16RNzoY6K9DU/qHY6s3xxfw2
	0APJz4dcBiuQDFjoN6npBmMYOXz7pGrKgM6c9X48HDO2zjSQ2u+NM6tIEtv1n/IiodPcBtMCLdz
	ptI/eW01p+mMHlntEM0TY2JFnczK6l+7PkKzBfrIXAClVI/3hjDPbUBettJ+d5Vox7K7cXA=
X-Received: by 2002:a05:7022:290:b0:1b5:dc3:209b with SMTP id a92af1059eb24-1b5568ac6b0mr11976416c88.22.1795465531758;
        Mon, 23 Nov 2026 12:25:31 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:4121:d698:201c:9274])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567e2bd1sm29277191c88.3.2026.11.23.12.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 12:25:30 -0800 (PST)
Date: Mon, 23 Nov 2026 12:25:27 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: Mattijs Korpershoek <mkorpershoek@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Fengping Yu <fengping.yu@mediatek.com>, 
	Marco Felsch <m.felsch@pengutronix.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, stable@vger.kernel.org
Subject: Re: [PATCH 08/10] Input: mt6779-keypad - enable keypad clock before
 programming registers
Message-ID: <awShM65vJT7DhZLT@google.com>
References: <20261123183200.3900004-1-lee@kernel.org>
 <20261123183200.3900004-9-lee@kernel.org>
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
In-Reply-To: <20261123183200.3900004-9-lee@kernel.org>

On Mon, Nov 23, 2026 at 06:31:14PM +0000, Lee Jones wrote:
> mt6779_keypad_pdrv_probe() writes the debounce and matrix selection
> registers over MMIO before acquiring and enabling the "kpd" clock via
> devm_clk_get_enabled().
> 
> When the keypad clock is gated off at boot or its clock provider defers
> probe, accessing unclocked keypad MMIO registers can trigger a bus abort
> or silently drop the configuration writes.
> 
> Acquire and enable the "kpd" clock before accessing the keypad
> registers.
> 
> Fixes: f28af984e771 ("Input: mt6779-keypad - add MediaTek keypad driver")
> Closes: https://sashiko.dev/#/bug/linux-fc15622a-407a-48b2-88db-195cdb311dbf
> Cc: stable@vger.kernel.org
> Signed-off-by: Lee Jones <lee@kernel.org>

Applied, thank you.

-- 
Dmitry
