Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795223484;
	b=HcZAPSrpcxD3vJB/x3FGfNITusprdEYPzNqiFr7IbTAdkD4Ta6G4YuJyZkJEI1jAclfw
	 PY5mxq+4ZOSnuHjIS36Me3z4VDdzWgOvTDP8O7DxwU4W1UolKzgqDlo575JuFSkK+DJ1p
	 Lm6jnefHZa9UuazM2VSUu6Yf9yJbmG6BNzVyJzpqbaYr/mzegKd84QQU3Sw5SRvKMPDYB
	 8XCPclh4FdQTHgRJURY3GoV2ij0hXK2wwkux+FZyDJa2bTZXbq5X3fs1PwCWi95e7KwpE
	 MH53nLVF+19l/B6OqM0MqGE7CFLPHtn31PnBpPwup4Pa4PzEQ4lxo2BmyBQu2QF5Wzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795223484;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=KCmwAi76omzV3Ocey3RKQm8GgxKEzZYW/hAI8TU8mC4=;
	b=hN4ZwLTOvMZXsrdojYTZo600mtM3dipDXf7GAjjy0Vn8RiDU1sGVE7wP1oBg9ns1KKam
	 VrpEEPjf0efyJbgf5+NHs/AjVBAFhl+wwO3VjfzzY67IHF4znjpBoJU2F5jEQWaviHKkT
	 j83oHXiAIA62fzD91jGgXWGUkY3hoTITBKzp0LFw8enZ0UpoMOscelXsc3zQg0cm61C5d
	 VKBqWvYK+q40EYeOgzcJ7NaFV868KwEMJE5jkDxR22yzdYktVaep2zwgZ3MJL8vz+rKwj
	 hnYst8r9jfG6Vcgxu3PaCWAC9GGevnYh1J6vZDa9kZBOoInxXJOdqHr/WRZGAlAHfPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vbEpg+3g;
	arc=none smtp.remote-ip=209.85.167.176
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6260660A6F5A
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 01:11:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6260660A6F5A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vbEpg+3g
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-53dda625f63so913208b6e.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 17:11:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795223481; x=1795828281; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KCmwAi76omzV3Ocey3RKQm8GgxKEzZYW/hAI8TU8mC4=;
        b=vbEpg+3g4jekdTHkPmtrwhQLE/eyJNgkmQOR6nfJD59QnllJNelKloF+7dumVGj+SS
         A/C/55NWWzD0XPSlHaRHb8BqTB1Ap3SJHcTNyOimn0WymYFd73Q3vukeXtX/Z13ebpYh
         U2UQWGNKLKIlN/ZHPtZEyvtJDZQgbfwePkDQRk0wMTl0i920kspNKG50EQdJYctqO54F
         lzFYKCFW0pcoffYZpQ9o+ZZ7JY58io55iLLYhLFZUSeh2WwE2eyInyGDfTvDzHbCzgHT
         /WENzKHLV7DUG696NACwUQ2I4Yr+895RgQtmUNXDYflyznKUAca1ITmHLtTZMyEJbNSG
         KxEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795223481; x=1795828281;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KCmwAi76omzV3Ocey3RKQm8GgxKEzZYW/hAI8TU8mC4=;
        b=OJw754cY+MvXuXpv4Pm7HtO17z+J004MLThLs4oJ9vyhUCaFH0T5BhosKEPwBdM30S
         /V0viCVBjieF5VOuzkSvKeLiJI4iPh+kA0YOKl+X6olrgxuRQvEHPwX8qVQUjaI4lWiv
         oTPjP6nNqmwdiQy4uga+UFOs7C+XoNPh1cs2tcxKItRjTG9ZkPyMaKVH2HDE0ty864Va
         fBSD+qIL4cTsOD2ySVsOfAHuGupkeaQl7HMLeK8QnLDVUJ1exSO6a20axOfp3cqwHFKk
         cVySeXFxP/Jm5tqTasaZTWiRuxmCw5voHZQ4Ia29tTRFtiqo8KTgTwFgGS0QvKMLpQ0v
         M6sQ==
X-Forwarded-Encrypted: i=1; AL+hErFcJCMglgUMs7NmGQizUPqVYAx6XxqtTRJrGxdYf2+ixqXUgn2MPJspR5NnYtSqMjx8MCwRV/YWcood6q8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+x7Sp9n908Q3/jI46bTX9/jL0baM6/D2T9MaP7ik5eMmOn5C0F
	3yR3e8Z9AJmWLW0T4Y9BM+5v1kZF6mUDjiwLlwdG05F6iYIUsGIDB/W8
X-Gm-Gg: AYBFou2rsUskKdCHbttX0o4svgEg2w7emNNqE6q/9VtDjrhe1/fRZ5zfqs7ti3AWeyW
	JunlvloQp2gi529rEp5hy1YgQFq0pNJSG342qUI7xMOtd/wb6CqE5M3QMBi7r4Ix1ENReV34+bx
	cpsCzH6eYpmQBxkNjql9i3AxX3QWqnCFaGODbZf6TExqf8bwh0aAooNDwBgj2oFdXp/RUr0Arl1
	44UPMyhN2G/fu0uA/YFaMhuB1IlDsmQ/iFZlUfr2WnyarsoMQpgkRXHLMmPhEosZe9FtTKjw1JC
	dDOn4atLESlkoHiUxeGlNCZXByiHTL6eZPGmxi0LURV8aJNH/TEiam9Pp/cnlZPK3KsQadPavQS
	7TtfeOsXE1rDtkDWHouGwL4oe+kow0I2ReajwQ9RLxoI7AoHZbmmVObA0NFbJB5shUsV3Qdx2ef
	XtSSZ2h+msbVTtwOVfwDu7dl6HkhzZYszDTLURn5xGHyYa+b6TW+cs2KELzvZuL1cq1ycT6VVzB
	p/VnudYPF2cNYMDHRDArmCwQ3gHG0FCb+l/DD7Y9+uvuyJcC7Iid/yNr/tQ4eZufGd7EYTnk8ZW
	5Gzy747cV8nYRitMuDoZtZluZDPaJ/Ums+DWZWCN+u2F1n8j/m1K0RadRRaKVBhAzAgNIlWQcVH
	TdR3V46+oVJhMlP5YrxpUuiRRqNDdM7wrzpjYhhCZ2JIYAAE/CUOaK543rLOS6xFwjxmjauF8jE
	aCmko4Lk7KPy6JNP81jFImKsWIY4tCyW1ctfxJyFH1MIVuEL81vFJ/TC8jIkb+XpRNXVlYfTFVF
	Q==
X-Received: by 2002:a05:6808:152b:b0:53c:156b:a16d with SMTP id 5614622812f47-57a0a70b0d0mr5784172b6e.56.1795223481233;
        Fri, 20 Nov 2026 17:11:21 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm3291532b6e.9.2026.11.20.17.11.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 17:11:20 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 18:10:41 -0700
Subject: [PATCH v11 18/26] mtd: rawnand: sunxi: send all address cycles in
 split operations
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-18-9721b1905ef4@gmail.com>
References: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-0-9721b1905ef4@gmail.com>
In-Reply-To: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-0-9721b1905ef4@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 James Hilliard <james.hilliard1@gmail.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.17-dev

When an address instruction exceeds the controller's eight-cycle limit,
the driver can report success without sending all of the requested
address. The parser splits the instruction; nand_subop_get_num_addr_cyc()
returns a count for the current part, but the driver treats it as an end
offset in the original instruction.

For example, an instruction with ten address cycles is accepted by the
parser and split into eight cycles followed by two. The second
suboperation starts at offset eight, so the old loop sends no address
at all while reporting success.

Use the returned count as the loop bound and retain the start offset only
when indexing the original address buffer. The parser limits each
suboperation to the eight cycles supported by the address registers.

Fixes: df5057999f8c ("mtd: rawnand: sunxi: Migrate to ->exec_op()")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index f8bc6e3c3ac9..ee68ef9bba33 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -2410,7 +2410,7 @@ static int sunxi_nfc_exec_subop(struct nand_chip *nand,
 		case NAND_OP_ADDR_INSTR:
 			remaining = nand_subop_get_num_addr_cyc(subop, i);
 			start = nand_subop_get_addr_start_off(subop, i);
-			for (j = 0; j < 8 && j + start < remaining; j++) {
+			for (j = 0; j < remaining; j++) {
 				u32 addr = instr->ctx.addr.addrs[j + start];
 
 				addrs[j / 4] |= addr << (j % 4) * 8;

-- 
2.53.0

