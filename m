Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795463996;
	b=UI/HLjObrglOs96ssybH7YT9APAJXYNatoGWrYsrFvCzVC23ohtHu4ubLBrJVfOuy7fB
	 i86y8nToXYtfV9HFU+EnlYbdtQmAnfnocjR4hRO5XsIrWoTuDZTEiRzDRfEjziExhrARl
	 ojmnZlbDe1vXED8YD2wDUQ+O3TvOL0OJuNoswwpwPJp7waV0NFgfQThj4fqgBLsQEi2xZ
	 krDcsDysMkMszjymD0htERa6tzVDFfQW8GXXYgTUBjPspVDzaUC7ivI3/wqCZZyDp/BnI
	 iQc8kQW3L1jZry1RmwIQnyTxVOluBWlR9xvREfHjMpmfng0uZRZ6Z3i5KTxP8I7qemA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795463996;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=g8D7FjHM0xGs0u5fsJgGRY1OLWeFaHEMIdi1LwzAiTk=;
	b=NguEq5gmPAS3WVutIFX44gQzbuoWT/JpD32OThy2FMw3po1CUKSvOOQlI/NlR4nrp3p9
	 CE3aqKUCKKxHYISTATCvXJ+imbuD5U+HnJqV1OB9K9ODEqnlTQ2vqRZQlO0kfi94V5Cm7
	 00aOS7ItkvPji1SpPhr8DZRbG7ef4ADOyrfxLEX78hxnh9T64/1Qm/YG1s4C/rHockG1/
	 Px5hfH5C7fE9V+ydfzx7W32EG6ke3E6kvxZpT9U1MU+SYH/HtQAf543bUGurRc4bUruJs
	 CKo0kV9D7mj5sxoJtTjSpGfJbHxZivWjedrQwHi1P6BonX8awV6eGlGS67OU4Hl43vA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CFHeGqxX;
	arc=none smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94871606A32C
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:59:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94871606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CFHeGqxX
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c4cdc606b47so635973266b.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:59:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795463994; x=1796068794; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g8D7FjHM0xGs0u5fsJgGRY1OLWeFaHEMIdi1LwzAiTk=;
        b=CFHeGqxXFkgbioxsx902NP4Q3FgTr+AgI6YI92t5flfnFbdo6XafKRV+quirlSXi+5
         yD8hVEGvro2b9ofUpHjLTq4sUhcrzTX9tc/OJyK4TPFKYFKr3UlsCMXqGo7lZJiFKKqZ
         vnqzwnkm/BCMhXu0WB96hjm+88ErR3E1PfbziBDjdTS+rCi/diFkrqxSBPJsN+znXLDY
         yqJ9vcDfcMNo6UWkiOWDoXDimVIL2I2Lt6bpHvip3j1h/KGqhMvu9/ci7Lz6WBUhSN8p
         s/MkpBa8/okjzYdWa7jwpUytJxLME15MOUjyBVGpvQQHUiA9nyf6X4v88+9QxVg3yYBN
         jnfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795463994; x=1796068794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g8D7FjHM0xGs0u5fsJgGRY1OLWeFaHEMIdi1LwzAiTk=;
        b=ZCGITp7MYyjYkJLdrD6vIBHAc+FmR8RJ+ATHHLh5QlU+fTlxUq65fZmt8x/DOZm5ta
         aUtOYbTgnNdngV0ytB5fRRsltip0xu3+wsAoF76oMM5tANeA+ElyI/NJFVaOyXts61To
         oosHUt+hOkHuakELWr2zsHfRZegHvQjzpp1/39h2ZZjhNR07zxXcjyqPVjnyX9RENGEa
         xQt0Ske5YTraguLy87rVFOpG3pm/oLFgWRm+/b1Ik8K3VGsxpLYmSzMLAz71SkaywEMo
         rXB+gxxha4kMSG9hU9D1xn3xuL6ANci67O3CndVfQxzrTcu2UgJCJXTLu4vGq11bgP9j
         P8kA==
X-Forwarded-Encrypted: i=1; AL+hErHGgOX/vup4/OnnOjO/Nt3VaW8TwmVWnxnAy5GCrOcKOxx5edmraJSPhYmAoUJfJk7djwZTgXdFV9Q8/sY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/CmTtKLzh+ZSckKGFZFeOPQDpIz9TBqPAdlSA79FN3njGh3jc6
	yHWuyCQnYElEYAPIHvkJLp3KgcpjzrNgb31Gr5X3n3CFZX0u3oM4vfYn
X-Gm-Gg: AZFdTZc+uyQD5ahvNeDZ4Ae4Fa6h1OGBF/8ISJZ0rEWUOblyk85+QVrVWMsIOIwA0Iq
	mkrBWF/E1LxT4rMWeJCdxnCp7TT/RLA4lCikFB9gg35p5dGTRNbJBm+tGv+Y76Bv9MThL8MlcRX
	zUB1h/EohQgAQEwOcKioIp7pN9yXz1yreXTc+5/Y/X8Jj83iD8ObRmtThdHLXnVievjMhPoNZaL
	ZdghkIW/jmFMTIpwxWcmaMMfL03hTsRYs6XOU2BBjR/15a1bwmbs2t4K7+5SnN7tY3FNVXOYZKL
	MalOYxTUsj7FqK3ocDzn819kELant+nXWH/o1Ex4RrrZOPh3LygSAgFne0Chrs1a2zoJa66FfT5
	e0vQIgbodVuauaNGoF5bT+pAAYY+sVXeuNibn8tMVcrvRxsfzmc1GAlu78qV5gKVsa2PPS8EHN1
	t4TYW5lskPq3GlY7ziStNsH9wu22XNRFDjNy5PpJdYx+A8pdIpjJ+JEiwVTRDzc0XRH7UQWpRmU
	GaucVf1x3w0nRmO8FqKkM0ma4WDEGtWKHIxfsqTW++fSz0vlp9abnIt713oKlsay2fW1Ix7HFan
	cMtRUAXhWLG2MoAKC+O5D4HegBJT
X-Received: by 2002:a17:906:e28a:b0:c31:e958:408c with SMTP id a640c23a62f3a-c513aab021fmr708355066b.38.1795463993838;
        Mon, 23 Nov 2026 11:59:53 -0800 (PST)
Received: from flare5 ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513acfe3b0sm438660266b.8.2026.11.23.11.59.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:59:53 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] pinctrl: qcom: Add Halliday pinctrl driver
Date: Mon, 23 Nov 2026 19:59:34 +0000
Message-ID: <20261123195935.1046144-1-lightofmysoul@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <su7onpn56wd2dtsn63qwbv5v65kci54rhqjndh6qjpb6gwlwnj@m2kxvcdrpjws>
References: <20261116-halliday-tlmm-v2-0-b4dd502ca142@gmail.com> <20261116-halliday-tlmm-v2-2-b4dd502ca142@gmail.com> <su7onpn56wd2dtsn63qwbv5v65kci54rhqjndh6qjpb6gwlwnj@m2kxvcdrpjws>
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

On Mon, Nov 23, 2026 at 05:16:55PM +0100, Bartosz Golaszewski wrote:
> Can you verify the pdc map against the interrupt map? It looks incomplete to
> me, there should be more wake GPIOs. Unless you have a reason to not
> include all of them?

I do not have the interrupt map. The PDC map is from the pinctrl-anorak
driver in Samsung's kernel source. There are 93 GPIOs with a wakeup
enable bit, but its PDC map contains only 76.

I did a test: set an interrupt handler on every unused PDC pin on
my headset and then I toggled each GPIO to see which pin fires.

1. Out of existing 76 entries 42 PDC pins got triggered. 26 are used
   by devices on the headset and 8 do not change their level,
   so these 34 are not tested.

2. 17 missing GPIOs: only 14 give a result:

     GPIO 42 -> PDC 105, 48 -> 87, 63 -> 122, 80 -> 42, 97 -> 96,
     105 -> 55, 143 -> 72, 151 -> 118, 168 -> 94, 205 -> 130,
     218 -> 124, 219 -> 68, 221 -> 133, 223 -> 134

   I am not sure about 151 and 168, their lines are not quiet on the
   headset. GPIOs 114, 125 and 162 do not change their level.

I think it is not a good idea to add these pins without documentation.
If someone can confirm these pins are correct then I will add them in
the next version.

> There's no egpio function. I assume you copied it from sm8550 but I
> think you should do something similar to commit a326b0523fc1 ("pinctrl:
> qcom: sa8775p: Enable egpio function") here.

I'll add this in v3. EGPIO_PRESENT is set on GPIOs 185 to 223.

Best regards,
Stanislav
