Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795503627;
	b=zNSHoSZTWBzOeTSwVDeeC8VSdAfAzjG8HJHHzqcP03Bfis0hnrD/mdW9MRzfGe9ktS4P
	 tAHMNIe79YgBXzUsz1jCYBQznOVi/2G6kcOIuVbNAltbaBOJ3dIdVAC4iywiLg6Pt7wo/
	 Ck4GOuRnHVO9jePbG0J7vqdkl60YSx5YA4PhyrgGSeUDCOFFvUQULZ6m2/t2hwYDJ2T/y
	 sBIGfsSowJpA+N4CXd/ARpnZCYbFF6UCFXqqkeLsKHqZUDyiOr0bfN8o+ROP3XJDlw8zL
	 /eVtQBkUKkXaYGSfS5ohNzkRW/1khJ7/bbWLsH4+aWW/n8m/FYcJT5+7/x6Fj9qodlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795503627;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Transfer-Encoding:MIME-Version:Content-Type;
	bh=s/NHlIq3UE1brmYtkqJh/mfk9i/Bh0D5vF4cK6kPHqY=;
	b=E+sUmIMSzLyXzcr9wRZkxDYMLDLaIF5yJ3MA3v0HaHZJhXYSDc04fgOGS6QdrDJQvdWb
	 yZlBXlO0UNuOQS2/EAXCqBHU5dYGnFtZO1x0/C/C0UEv9gjKfh7qyn4YZ/6KvoSLyKzJs
	 IfWTViUb6LhNqmqe40zJWpwUlqBj+Npr39rM0oUqQ8dCg3COWP5uOvRIym0n50jBxfDjz
	 Q6CxFqKOZRHY3WdBDp/w/XS9FBPWzkLvdLt3X+jllGXh4wPxhgEEQn3s6EY5UxxAFcWOp
	 of6jsDsqV39OQ+NIgp6ZRLrNHuX2Y9sZSdzJ3s2vJdDXB6/MvTdwktiXS1VI9dJXDgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gkbg+gCr;
	arc=none smtp.remote-ip=209.85.167.50
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9490E606A327
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 07:00:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9490E606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gkbg+gCr
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5bccecba199so3953173e87.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 23:00:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795503626; x=1796108426; darn=vger.kernel.org;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s/NHlIq3UE1brmYtkqJh/mfk9i/Bh0D5vF4cK6kPHqY=;
        b=Gkbg+gCrbNN3WNgHhi0uF+8i2d7zwOXPgd9yVLZvjD7rxu9P5JeYcbwXcMSyngmxED
         piEUN9osN5BF/fOSx9HZvpLP2t+3P6z7s1p2UXXbrBC0sYY3Ee73LIgXzpOwlPZhgu2V
         6WAqcUqZH0VFmHW81tjVS7UIoCmSXkjpRznEDcbRECjyvVf0DcU3cohcGQuT53Z3D8HC
         iPUS33qsaKBSDlvZ58/yAqUFs/8KJuvkGUZLceRrOCBS+5VM4kTqpv7wJrNUHxljW+9Z
         rGPuHfTNZj124G/RtcA1Unk59fijky3CIzK0AmF2ngpVc6nGAvcolqzzX7edVnmiIbtN
         WBaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795503626; x=1796108426;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s/NHlIq3UE1brmYtkqJh/mfk9i/Bh0D5vF4cK6kPHqY=;
        b=gCpDImgmFI0tHzhdDvKigjFDWS7ilM9HkqlupSXPVe0Ld3KbFqgggdRrbM7ZoZQnut
         7ikisrcA75AbNKHm3qCjX5MHy+tpXCYPWMzPkcV8tDhdbDg0Sv+wJ+Hb9PCgw9Q3oXwE
         mEwA3i1pGNA+NOh678KlXeeXqrAbOTrQ8KvgVIuj5tc7EKeGAhArGq11abXpE5QfFbRt
         4araiOQrs2jOC85EhQ8Kh21/Yb7Uiaiq0ZP2HxenTDtJ0xVHoJSPcL0DQfffw2kOrvIA
         AI9sI5rli51gw70kZ0RFfa8nWqsrBflrJQtCzBRWICpAA9il7KyKaSnLp2lJ0P/V+59/
         JtyQ==
X-Forwarded-Encrypted: i=1; AL+hErHUHVwaS1Os80XwPRgL5GpEJFFUhx8Kh5gOLyd25ucCa3RtC8D5ZeMnkoXYYokHco5PgiIETqWj0WsY0Uc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/oHjvxFYWTP5pTfazgXpUFM+OdMDWAjqmZn3GHzHKwWu/OX3oQ
	5sjSsz8XN4nRvfpgQ73uT/3dAdqKRkITfIXDbSSQYIF87iJcDK3RVdl4
X-Gm-Gg: AZFdTZeB8m6DZe1O8lklkrrIwvRx7v3t0goBEbgPEBZhgnjjkVOoH/MlglnGTaZLNHn
	ZcQz/wLfbfE9XMbOZVxIljLR4dsMXtre/ap4yUqFaVVZ+P275eViyPQ824FPNZT4RZr2oDICBx1
	6RWPJBrvEqRk8sVvf0Wxu4+DAe9sNz10tt99Jsr2yTi55nNvoCB9D+okl3PoKEsu7w9CWlgo6Wd
	g8O0EWspXU2TgA5BkFg71SRe0YaPXyI4/PLu2mpR/cJ5aOcbhmcKJGsvi/B8ZCd91zT8ZP3MwvH
	hI9/dVOOCNcy0vl5LVNxwksxR3b/mvDrhVI1s7rXgTp6ozqtUQWgmoQl0etHBDH9ADYo2ia/jG8
	FeDejAOldWiWncJFhPYHAEscTDaR1E23gGO4WWVSFDqeLxQ92VPYug0HChrKoQ/a65/3TpHRIJU
	E4HzGT2DMq/vv5ZqSsu5SS1yrO+HS9zPwUZQSd7D15zNSb2nEf8JEAeI3zzJa3IBvYXpw3bHiX4
	IZe+NHNPzeW8uY0LD3ZmaUH6QmPz0D7aw3OAzgTxl2jT01xVRfOUhBQus91vITdSW/YxyZBNYr9
	iKXJJO6rTzMY3BWva4XRjkTUMbAX7sIUq8zTHXWRVvnvQNJCcZVbuMs=
X-Received: by 2002:a05:6512:23a9:b0:5c1:ac60:14fc with SMTP id 2adb3069b0e04-5c1bc7c2ad1mr4864356e87.19.1795503625540;
        Mon, 23 Nov 2026 23:00:25 -0800 (PST)
Received: from [127.0.1.1] (ip-024-180.users.dtel.ru. [91.210.24.180])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bcf33b5csm3615530e87.8.2026.11.23.23.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 23:00:24 -0800 (PST)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-gpio@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/5] dt-bindings: soc: Add Cortina Systems CS7542
 global control block
In-Reply-To: <7bce0280-704e-42ce-ba65-d3ab369bc20c@kernel.org>
References: <20261123-cs7542-syscon-v3-0-f1c07a1703f8@gmail.com>
 <20261123-cs7542-syscon-v3-1-f1c07a1703f8@gmail.com>
 <7bce0280-704e-42ce-ba65-d3ab369bc20c@kernel.org>
Date: Tue, 24 Nov 2026 09:58:48 +0300
Message-ID: <179550352883.4.9894258481538485863@gmail.com>
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="fixed"

Hi Krzysztof,

Understood, and sorry for the rapid rerolls. I should have left time for
review instead of posting v2/v3 while the earlier series was still being
reviewed. I will collect the remaining feedback and avoid another
immediate reroll. Follow-up fixes will stay in the preparation branches
meanwhile.

Thanks,
Fil

