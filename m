Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794945919;
	b=1tXbNgXRnIj66/pFLf75G1P01SF4LSG3dZFLWYtlt7M4hfzLmxDsNv46hjKINq6/tMeQ
	 AJnIm3M7mk+QsDp9KMfkv7ILFYNwaWVIhAf7XdBr7b0S9eW/y4EVjXqkhnQFvNSiMowrj
	 I6RHjeoDj6zZL3pMs+/fmM1OISLBkhgLEYTdtFa3CAWQwRYjineWRQvDsSb7pUmiV/sXA
	 +AnipB1J4mps2NCueUC+dhfA/eFQteAUKPAZlkQ9skm8wAlcHb5/E3cZ3r1WUR/Ks0bB6
	 9EYoDLzu68DFrTof9dKn9V5EJzS9fdynVo5h0wLf3M8VfjVz6WtKJHrAb9zf9laRQDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794945919;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=UPJHLmwLZlatSt25hUeelYOc++vjVu9QgMh/X2VZQWE=;
	b=c736QlQLKRiLQNdqpD/RbZESVzbL5qEcvq2OGj2ST5hI6PzXgT6mFPnMBXri3GqJz9D3
	 D9R76IK6OsXnC1DmKSo3aZcVRTfVNZvSLpxbHFZutitjdEWSL5st2NJrxy7DmEFT0XvTG
	 2u1dh/2n16n4ZUAgB6/rLrd7oIXURRz2L9my75DX/pvbE2I1zGFC4oC9hmEFvAVtduxl5
	 CBm+jUtSx58w8UywmGKGcWpYi/RAbJYlXLm0F1ujBXatCDE6Wd2RpES+GrOz/d0JIcezj
	 HFYPdeYQZKF/VpWDn318KyVnq6qjEhzO7Rgjn7Qv1Jq4atGdT3huyUq2NNNVnTJfe3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MhjW25tI;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BED79606BDD2
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 20:05:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BED79606BDD2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MhjW25tI
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-497614c95f0so90830f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 12:05:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794945917; x=1795550717; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UPJHLmwLZlatSt25hUeelYOc++vjVu9QgMh/X2VZQWE=;
        b=MhjW25tIfRYDFt6msKWXKEZvsJV6FE5BXzi3zLiQABXwwGUAb5mjJJggmlAam4lj3b
         vhPPsArgE4/SYAa+JMmZDpvUr0om/K7XKG8DCsfpZyelmr+S485w1DRAzID/YEqZb3EY
         X7wb4bvJ2dFOfgMqvjavHoFFFYpW0wmrtm02fCdi8AOWM98wqAdRKgVgQLdTzJDL9H/O
         z/H3LFCPflALGVzOGNyE1TDhtcN0oOX/qVni+8nM3ne1xcUh3JxY1QDDMoWLAH6eHpIy
         mDCS2tIKmDeeGidOh7Nb10Y3iVTXYhq2Yg5yb1m4ZCuxEWn22XO8ELQS1Undomc/aKEh
         DOLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794945917; x=1795550717;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UPJHLmwLZlatSt25hUeelYOc++vjVu9QgMh/X2VZQWE=;
        b=mbk2KNzI6N04HtgavK7w+FsfbG4avPHkrU4E+ewZhNy358Q4TMu7djLkZwRdNID0cj
         ag1hf1KhHFMt+OpDrN0JqHZR+Y1/jI1h2Orwe3n1ZTz6hghHQxafYLsY1o9Vou5HeTHJ
         iuLPwZf2GNaikIZwsgSdx/gbXWNMOEaeRGMM0NZZGHE/C7KiklkcXrPRs1/HSaSqwFrU
         aRSe8pFSOdTRR+Ytup62y4H0gL4wpe3LAZfQSPS/cB1UhfbfxQa8YOjqW2BBpyQzYM49
         uoh2g8+ql/8mqp1Sifroa1cVtCjIOD3bkDI49G6vC5ODUuP9npphN+IWSmF7yrNPu+zH
         T5+g==
X-Forwarded-Encrypted: i=1; AL+hErFjkbDF/QW3Vdpsr3ovdHx33QT4N4lkiFquES8dr8zXVQjwahDZF4GlXOGvJpt+IEnnoxGypVQnn9+JGhQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/WRGWUBzzCvf7xi2JJedYxY6+cKCInel58258dZL0seGYczXZt
	2ZJnu1XrVKEPq5lZKSAPEAOkJgBam4BChD/7MkaPJNFzf3ibmrz0Xuyo
X-Gm-Gg: AZFdTZdZQ/cc4e/oZ9zuFPa3Ej9+LYtxtp8p05PMHieb5tiUfjF7kraWa0RRlvUrJBR
	Ewr0XU9kcD4NN2ia4XoynsS2q+9E+gmDA08e/maCk5lMjBVVShkPKUTBGzOXezLnz6lhqy2zlxi
	CX+NfdixNcW5ILDfjLvZUVIxB+4hIXZoJ5h+HKFpbxtFPuw5+SRFSXPZyZO/x86jGsKVGQPrmjX
	yWsPhLVWSngmlbMT8tZ/W98flAcJC+/iUmW/kLXHP+99Gue0u/jk2Bp4V/ROJT8laS3xhjXvgMD
	NvuETp+VbaqV+Hgs+VDy1N0tcaT4uuUvXeYXOCWFxUwC9NquJ8enQX0vFgBBMv8YN2kwRSh/rRh
	Tl83OEcncPBpl4L9SYdgAZqZ3IPEV6VzwVdttZDhofZg+FxgORLP0NCFf5nbnXk8++6jdJeMeqC
	hbrHFXx5TzJhWbB01jt9zOn0bwfzR2uKJvvX6vFAL6+WorA6QdTdUldHbHd5eN8GG8hVuxvhdWF
	K+Ea3AXX+FdJfBqhpf0MrWt357KjNcuSsHGjZ2RhGdsmfh3Osu6TjCIcTwWFinpHY81xR8Rwd3M
	A2FiCrB3aAq/Gw//k6PEZf5WLH73
X-Received: by 2002:adf:e002:0:20b0:4a1:a2ed:bc1d with SMTP id ffacd0b85a97d-4a63b6fbe61mr885459f8f.43.1794945917177;
        Tue, 17 Nov 2026 12:05:17 -0800 (PST)
Received: from m2.. ([37.142.154.208])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4a64b60940csm625528f8f.0.2026.11.17.12.05.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 12:05:16 -0800 (PST)
From: Michael Zaidman <michael.zaidman@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Raman Varabets <kernel-linux-20260610-80b7ab08@raman.v1.sg>,
	Germain Hebert <germain.hebert@ca.abb.com>,
	Christina Quast <contact@christina-quast.de>,
	Rio Liu <rio@r26.me>,
	Bruno Giacomazzi <brunoceg1@gmail.com>,
	linux-input@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Zaidman <michael.zaidman@gmail.com>
Subject: [PATCH v4 07/16] HID: ft260: uart: enable flow control
Date: Tue, 17 Nov 2026 22:04:13 +0200
Message-ID: <20261117200423.19561-8-michael.zaidman@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261117200423.19561-1-michael.zaidman@gmail.com>
References: <20261117200423.19561-1-michael.zaidman@gmail.com>
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

The FT260 is a full-speed USB device. Interrupt transfers poll at 1 ms
with a 64-byte max packet size, so the theoretical UART payload ceiling
is about 60 kB/s (~600 kbaud in 8N1). The chip advertises baud rates
above 1M and small transfers can work there, but large transfers are not
reliable above 460800 baud without flow control.

Stop forcing FT260_UART_CFG_FLOW_CTRL_NONE after termios setup. Honor
CRTSCTS (RTS/CTS) and IXON/IXOFF (XON/XOFF) when configuring the UART.

Tested at 1500000 baud both directions against an FT2232H with XON/XOFF
and with RTS/CTS (~2.9 MB transfers, no data corruption).

Signed-off-by: Michael Zaidman <michael.zaidman@gmail.com>
---
 drivers/hid/hid-ft260.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/hid/hid-ft260.c b/drivers/hid/hid-ft260.c
index f722ef0ddf06..21789e97fd18 100644
--- a/drivers/hid/hid-ft260.c
+++ b/drivers/hid/hid-ft260.c
@@ -1945,8 +1945,12 @@ static int ft260_uart_change_speed(struct ft260_device *port,
 
 	if (termios->c_cflag & CRTSCTS)
 		req.flow_ctrl = FT260_UART_CFG_FLOW_CTRL_RTS_CTS;
+	else if (termios->c_iflag & (IXON | IXOFF))
+		req.flow_ctrl = FT260_UART_CFG_FLOW_CTRL_XON_XOFF;
 	else
-		req.flow_ctrl = FT260_UART_CFG_FLOW_CTRL_OFF;
+		req.flow_ctrl = FT260_UART_CFG_FLOW_CTRL_NONE;
+
+	req.breaking = FT260_UART_CFG_BREAKING_NO;
 
 	ft260_dbg("configured termios: flow control: %d, baudrate: %d, ",
 		  req.flow_ctrl, baud);
@@ -1954,9 +1958,6 @@ static int ft260_uart_change_speed(struct ft260_device *port,
 		  req.data_bit, req.parity,
 		  req.stop_bit, req.breaking);
 
-	req.flow_ctrl = FT260_UART_CFG_FLOW_CTRL_NONE;
-	req.breaking = FT260_UART_CFG_BREAKING_NO;
-
 	ret = ft260_hid_feature_report_set(hdev, (u8 *)&req, sizeof(req));
 	if (ret < 0)
 		hid_err(hdev, "failed to change termios: %d\n", ret);
-- 
2.43.0

