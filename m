Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795707936;
	b=mlzkIHxi7VDi8GHhUYqvhvPcxSTv7jiTPGdrYonaUY00rgaPZrNC2LZIOjhAW+8x8nPD
	 Wy6CtSKJnbhGQuS0QnQH16dXUwip1hljRJVX4107QauXtFoe9s2VG50+PGsuff98IYwvy
	 P7QP4A2AwZVRgczdNCVCUQ/Wrfu3e7MQJwxIZtch/OycqBAK1NdCZWEYrGAO7T2U1826R
	 zmoXVWpkWgQQ1D0Rf3wt30snVnW9oyPS144kLHXelJTEYmx9emlVO2tZ3AKj69HtxVrE0
	 6RglQrVtaCIoG+KpO6tLL9gefO3d8jxYWk6bvt1JZxpTNM/QB0u7vP8MOOpQIKgdOfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795707936;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=HYHQpE1qS5H14Gep8V33fXeQq629sOdOJ5tH0yp4xMg=;
	b=p/39PUvHM2Eg7FIflBVQw9m2UCo3OPlfiilMSaIyQAMR0pdIV3myCzzNGkEEiCao+UyA
	 n3kbiKGz1XKxH4yiTh9Mmsp6JX2rC3rrp3EK2qaDyPBjYjYQ31Zsfj9bIGY75OyCEzscg
	 YlYcBzCYHNl7RNPZT8tfyhlOYfrDP2E/CJ6n+ZY4w/Ur7OsHBFbJ5ekJLvj+UKIZCbWwd
	 7QCe5gSwkwYk7d3npI/SBSxtdpTMLeN1BPaqmMMpgnibdecRESu6jwh5QwxhlLlTdMLUf
	 XFMv4LUIfvwyRIZEQpNVVFbWJwkgypTpIZttcAMAUT7WtrZ5gKJ0E1LE9JyQlxlpW0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.222.181
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08144606A336
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 15:45:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08144606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-93f20b304c0so641435885a.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 07:45:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795707935; x=1796312735;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HYHQpE1qS5H14Gep8V33fXeQq629sOdOJ5tH0yp4xMg=;
        b=yF8PGuoQuW9MpEaRIaQzMhVW/OXHCWeF381Z/aqYASq1H+TfQMq526NdIdvfLQbqAb
         8hIouVRYP0t7EgAJD21lQe5nPxLVZuompcuUt9e1jGl33tjHSZGeDxjEvcuWf17bKr3f
         ore2CGm5oI+I7twtwlZx3edrSxPwwKUTPpWnBVPfqBUisRaSIXVBtSprXteeYjtYnJsA
         7ZRWryIz6CD/GikstiQSSzVWAU2yREl69YfbE8vDbYQXqqvTbK464Jc9jrezovL1kN33
         68263dFXZ5NNx2EJN3XxKLhTgRdBR0obxKnM7hgJVJFG9EeliiHw6s03umPf66kZ5RoX
         X24A==
X-Forwarded-Encrypted: i=1; AL+hErESk5Yc45PXQ8eToxbNyiXIGcHja8GmQHE+Tx7vbqqAb7F9yxvjpjm/fAOUzGpGGv8QlDNsFFxV5OsHP18=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Ax23J5C4fti7JZUYOcMBVzHpqX5gZn6ycCS9CUjwoFnMg2cbw
	Y3ormnrCcNLU/k5MoKxdH6cgrunzL1JfY4LBoCmy07FvuBUoapYQzStg5NnI1wsu
X-Gm-Gg: AZFdTZd2uzOm+JRyeqTPTiZuKsYlFc6sAEu6qd45m9f5BZLr+14Jrx1t+sv0oVnfdVf
	A0qk+iuuV5aKDUmpcch8BckVYrtObpE2VxpsyYAo5pfW7YNgh8NBYZuZ6xRw4yUWGqLB6U6hAW0
	oGDmYDqUPDYrzH8fTj2TpLXMhUR7vLA5EjxN9OZwiyMv85j8wOQERo/cqYc/fessvkpTqorHIy2
	jaiu+lrbT5RN1tcCS0C0etDO3M9LTJJourYRF83m9wQUt5DwSMzfXHZGkMLDjStY9BTXGllxvGk
	EeFYcXcLCZ48yFqVD7Jtx2OvdbdT+qcdOtW2RIo0p8gG2cmcnvZqmF4t77a7d5HLIe/dF6txvJR
	RA4JWtW4qVOi+LscIO/Oil/ve5ADe6fDmwnafSXgf/10g/3WAhov/a2aPT6lDTnnO71v0ZEJTV4
	h0PZyyCzS/+FkOpTZ2YhULyTWdP8a2ipL7PD5g2ABi4O546UBfhJH26mYzpFAnCYDIri04fuTme
	83TzT7eovCrQp6OwcrvXW6lFxF3v31ST0uaPjyVLGoU8uNTQWhEdp3Ik+0mCJo76k/+DHE0TWna
	ihxqvot1X7vZSfqqa3UbL0wfkONxcbRnirjmjQvnR1FqQ2ZRl9rHi44+Kzwwtdl8fVs=
X-Received: by 2002:a05:620a:462a:b0:93e:c12c:9dc4 with SMTP id af79cd13be357-949bab23b5bmr3741322285a.68.1795707934418;
        Thu, 26 Nov 2026 07:45:34 -0800 (PST)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb0354a9sm1611795385a.5.2026.11.26.07.45.34
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 07:45:34 -0800 (PST)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-990fbae94f5so3784285241.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 07:45:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGW8u0Ym5MoDr7WXLPL/5eSPw0uw6R0LQWTcKB27Z76Olb0SuhU00pUCoixN+h14ZIXgxfEvD+k+cCCgho=@vger.kernel.org
X-Received: by 2002:a05:6102:3593:b0:7d2:cf82:1a5f with SMTP id
 ada2fe7eead31-7d7395d2150mr11590021137.24.1795707933875; Thu, 26 Nov 2026
 07:45:33 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029-divo-ssgrlpcsrc-2966-i3c-anf-v1-1-a5d2ff9b1367@renesas.com>
In-Reply-To: <20261029-divo-ssgrlpcsrc-2966-i3c-anf-v1-1-a5d2ff9b1367@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Nov 2026 16:45:22 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVJ3=ahkor7_5bTBJ6bDCW73KaBWqyCgR2S7YKvDmgLOg@mail.gmail.com>
X-Gm-Features: Aa3M54qSbWMSs1guGrg_PhByhryhHmWHwUWN36IXzOUxut6Ewo5mcuw0CYVtPGw
Message-ID: <CAMuHMdVJ3=ahkor7_5bTBJ6bDCW73KaBWqyCgR2S7YKvDmgLOg@mail.gmail.com>
Subject: Re: [PATCH] soc: renesas: rz-sysc: Remove SYS_I3C_CFG register
To: Diogo Ivo <diogo.ivo.sx@renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 29 Oct 2026 at 18:52, Diogo Ivo <diogo.ivo.sx@renesas.com> wrote:
> As per the Renesas HW team this register was unintentionally left
> in the HW manual of both the RZ/G3S and RZ/G3L and should be removed
> from the code, so do it. No functional changes intended.
>
> Signed-off-by: Diogo Ivo <diogo.ivo.sx@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.5.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
