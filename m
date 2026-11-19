Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795113349;
	b=PhqvaiEAGtq1r67DxmMfFDGbI/ZqrmCLPaNWVWDMX6aoyo8ZCULbUpJabZe13Rkl8OQc
	 Z4FFxMv3mtPcaDfiHqrxbf1ssba5NTtw+aH4c01Z1XfBaSyv427d0LwP8zPzF1SXXLvi8
	 J7j+l0bjR13pt/gXtLc40X/HFGttlszRi7BVaKv+fTWSF2b/nuhXOczkkB3Sbdd3Y8T7B
	 qKnDRL8uZSVlA5RPBg+riVdF/QZ4q8Tp5AZesLGPeWmZf5UcWQx88uZtuB2SU+oHrXgbj
	 i5UXPmVQKKojfrztD3D6qFPfZbUTIf608XjGmrEjyuNJkev3GPe3/w8wPKLlLzqxMig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795113349;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Wu7mN5VFHV7aEns2Y1kkp+ju09FFF+qoZnlkJTB7Cyc=;
	b=na577ixbbJ6O72uK6rgZap/QdkWuROVQ0gGlCJ1IReQLQzRUnzjzih6k5mvGfjRyu4ks
	 m/EeFAdZaIIjR1B5MiZNxjVf8kaYk0Dve4hF3sXG10QFHT3KssbnkJgwsPXdKIw8WrWz5
	 5+C88FbCDbYadE7HrwWTcfy2ieH6WCDdmEOKbBYGZUAlfqS6Bp4SVQjoMJTkjbkZq+2nZ
	 Cl5CFhmCslTWBepeVKybaRDtlpdajsw6T+GveASfyfs2ttEjSxlWmUlztLWAb1GuuuBvW
	 BKaF96ZE4bFjqqe8UOmtE8PcEh84+b3RKm8On7pkj+rE48X8FFChGVE/0Jl/wqq5h9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GufA8C1E;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABFB3606A325
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 18:35:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABFB3606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GufA8C1E
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2f020d0169eso291315ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 10:35:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795113348; x=1795718148; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Wu7mN5VFHV7aEns2Y1kkp+ju09FFF+qoZnlkJTB7Cyc=;
        b=GufA8C1E0JRgyB3MTk+oz4VjJR0jyumN/4zL/sbaysHpBxIEBG8tqGty5Tb6EWijpe
         7QxmUA+2eDW0bTr6SCk0jiW8uJQSP+x5T28HhJpknwQBeuYhszILI+YsWlnnd5SwLvMj
         UCB1Ok4mq2bQkzkVUDkWxhgVYMoyDB8yJmWO1a26oPi9Kl1TN/MZeKNUX8WtcC7s5tQq
         GDWxk2StFJuPqaupRHWR/zx+GaFXqlKdUEMIMxTwyAq9hk95/SNCOf6KAHaz6DAqe69U
         XSlSSyc7wcSMBngieDzMBV86A+gV3KarGU7sVlfOBPpJcEE+CEHZnQCli9srtubz4FHk
         9dWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795113348; x=1795718148;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wu7mN5VFHV7aEns2Y1kkp+ju09FFF+qoZnlkJTB7Cyc=;
        b=vDCWDQDcBkOLvpqCLkQxEiHME/kzBn0X0tzYTyUTe9kszhQPd3iBciQGEfDkRU0PES
         N3SmBjSv8HASPL35u5JI5LXcLb1jPzvAFz7BtSz4o0AI9JAjehnuUrofwsNVKU+iU6fs
         v0iGlOuQbCxCb08/wOfksT6C9YRpPzBC8wdl0L4495dB6wbs2noVZ3TS2JcbVwzisQIX
         tozfEnfADOA0kmHvwCai7PW4CfFKdvAYWptml1wYNkiIZKGK0XUgJ5CBIKPm1JQc+Bu1
         YJ1GzcVQOVqDfQ30ghrfUXHZYwB7TPLX6RSH8Ctqqa/a90WtozUQ6W7xTk/m7Rqk/Z3y
         +A6g==
X-Forwarded-Encrypted: i=1; AL+hErEBrqFTe0tRoTFUI1nbBAbZu8nzw5vyQODRB9HR7Mimjia7UZ9TEi9iCGmXEQb31Ewt4tOg8mFlC/bCTks=@vger.kernel.org
X-Gm-Message-State: APuU4Z+GTJBMhFLNk/5lvnFVYPgjvWubGWfO/UU1rnyjNxUIuoJIN1Q2
	5GlTzbS9b2cWPOpgf7kPYi6+H7FpHno3u4bRuJ4c2WjD7Y+171Piu2E7
X-Gm-Gg: AZFdTZcJfHzxMZmaXLaZzq9rz/T3aSqoFJ9V31jAPABzquNm/ON40LCEECtu1uVWaU9
	3XetE0usxS6jrTq6r3GYPci/PF8neiCIWOnryuyknArzKVtXlOZB0H3ZY2ZNAfL6kGSjfXJo4LS
	fy6FFkUiTxLY6loYpqOUW/P5okz3dh2KzZSOZI0wRLDQ6IaDOZ49C32QyCwVnH+IMVIt/e83i0p
	gxPNK0uj2sWHvUSWACRcxWcXjwfEemKMUvr49rUoLYKqg+gnxe42/1GmslM57VPb2nKoQLMiNg6
	R62APHga4ChBtlo4D9Zm8QSuRhSsWLIEmD7MBLG6OgFRDSBeG0dSKCJh/Sbi+S189cSSD1DFzYF
	qoczEnm2KwbKc8VwccUAlWq4oO8SEak0O+hCY2uvssmrMZiqkjjl8wwm6ZVof8FeRV2MBPE6/s2
	QryvIk3lVsw5agGSc81B8xFe4C6BclawtuW8GiYWZAIqPTh7ymvokf20Z3kPOPslfj2DWU/U+Nf
	n9i86MvWwm4KpQSuEqpnd1xU6W7sxuRT8Yy2G5cfQYxkM+WPBR0SO/KgnveMbiir0QkcjeV0kzX
	W1htmjWKJ6Jsi/h7BvhW4x/3A/TwAgUnGMNpTgOcF8ppcyj10El6
X-Received: by 2002:a17:903:19cb:b0:2ed:101c:480a with SMTP id d9443c01a7336-2f03f1c007dmr8013355ad.37.1795113347742;
        Thu, 19 Nov 2026 10:35:47 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac5:6213:28::4:379])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f118c72sm3490105ad.54.2026.11.19.10.35.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 10:35:47 -0800 (PST)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v3] net: dsa: motorcomm: Resync SMI slave before register access
Date: Fri, 20 Nov 2026 02:35:35 +0800
Message-ID: <20261119183539.1028929-1-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
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

A register access over MDIO is 4 frames: 2 address writes followed by
2 data reads or writes. The SMI slave tracks the phase in a state
machine, so an access interrupted between frames, e.g. on an MDIO bus
error, leaves the machine in an unknown state, and every following
access fails or acts on a stale address until the machine is realigned.

The driver has so far assumed every access succeeds, and relied on
manual resetting when the state machine wedged. However, without a
dedicated reset line, the reset itself goes through the same SMI
interface, causing a chicken-and-egg problem.

Realign the machine once at reset, before the first register access.

Signed-off-by: David Yang <mmyangfl@gmail.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
v3:
 - fix transition table
 - add dev_err
v2: https://lore.kernel.org/r/20261116162303.1368472-1-mmyangfl@gmail.com
 - only reset once at setup
v1: https://lore.kernel.org/r/20261111163954.1132921-1-mmyangfl@gmail.com
 drivers/net/dsa/motorcomm/chip.c | 102 +++++++++++++++++++++++++++++++
 1 file changed, 102 insertions(+)

diff --git a/drivers/net/dsa/motorcomm/chip.c b/drivers/net/dsa/motorcomm/chip.c
index 35e70b322608..86e14ec24abc 100644
--- a/drivers/net/dsa/motorcomm/chip.c
+++ b/drivers/net/dsa/motorcomm/chip.c
@@ -98,6 +98,101 @@ struct yt921x_reg_mdio {
 
 /* TODO: SPI/I2C */
 
+/* Realign the SMI state machine as described below.
+ *
+ * An SMI register access is 4 MDIO frames. An interrupted access leaves the
+ * machine in an unknown state, and every following access fails or acts on a
+ * stale address.
+ *
+ * The driver used to assume every access succeeds, and relied on manual
+ * resetting when the state machine wedged. However, without a dedicated reset
+ * line, the reset itself goes through the same SMI interface, causing a
+ * chicken-and-egg problem. Furthermore, the driver verifies the chip id before
+ * firing the reset, so the reset can never be triggered reliably.
+ *
+ * (A/D: address/data, H/L: hi/lo byte, r/w: read/write, ?: the same flag within
+ * a rule)
+ *
+ * State Input Next Comment
+ * ----- ----- ---- -------
+ * AH    aw?   AL?  step #1
+ * AL?   aw?   DH?  step #2
+ * DH?   d?    DL?  step #3
+ * DL?   d?    AH   step #4
+ * A?    dr    A?   `0xdead` sentinel
+ * ALw   awr   AH   FSM reset
+ * D?r   awr   AH   abort, frame discarded
+ * DHw   awr   AH   abort, frame discarded
+ * DHw   dr    DHw  `0xdead` sentinel
+ * DLr   dw    ?    `0xdead` on following drs; next state undetermined
+ * DLw   awr   ALr  abort, frame consumed as next access's addr-hi
+ * DLw   dr    ?    `0xdead` sentinel; next state undetermined
+ *
+ * Any other REGAD/op combination is not characterized and never sent.
+ *
+ * The reset sequence is awr, dr, dr, awr, awr, dr, dr, plus one more dr
+ * as a heuristic sanity check. The sentinel cannot tell AH from AL, which is
+ * why the check is heuristic.
+ *
+ * This is bus-related, but I'm not sure whether it should go to
+ * yt921x_reg_ops - decide it later when we do have a second bus type.
+ */
+static int yt921x_reg_mdio_reset(void *context)
+{
+	struct yt921x_reg_mdio *mdio = context;
+	struct mii_bus *bus = mdio->bus;
+	int addr = mdio->addr;
+	u32 reg_addr;
+	u32 reg_data;
+	int res;
+
+	mutex_lock_nested(&bus->mdio_lock, MDIO_MUTEX_NESTED);
+
+	reg_addr = YT921X_SMI_SWITCHID(mdio->switchid) | YT921X_SMI_ADDR |
+		   YT921X_SMI_READ;
+	reg_data = YT921X_SMI_SWITCHID(mdio->switchid) | YT921X_SMI_DATA |
+		   YT921X_SMI_READ;
+
+	/* awr */
+	res = __mdiobus_write(bus, addr, reg_addr, 0);
+	if (res)
+		goto end;
+	/* dr */
+	res = __mdiobus_read(bus, addr, reg_data);
+	if (res < 0)
+		goto end;
+	/* dr */
+	res = __mdiobus_read(bus, addr, reg_data);
+	if (res < 0)
+		goto end;
+	/* awr */
+	res = __mdiobus_write(bus, addr, reg_addr, 0);
+	if (res)
+		goto end;
+	/* awr */
+	res = __mdiobus_write(bus, addr, reg_addr, 0);
+	if (res)
+		goto end;
+	/* dr */
+	res = __mdiobus_read(bus, addr, reg_data);
+	if (res < 0)
+		goto end;
+	/* dr */
+	res = __mdiobus_read(bus, addr, reg_data);
+	if (res < 0)
+		goto end;
+	/* Heuristic sanity check: expect the `0xdead` sentinel. */
+	res = __mdiobus_read(bus, addr, reg_data);
+	if (res < 0)
+		goto end;
+	res = res != 0xdead ? -EIO : 0;
+
+end:
+	mutex_unlock(&bus->mdio_lock);
+
+	return res;
+}
+
 static int yt921x_reg_mdio_read(void *context, u32 reg, u32 *valp)
 {
 	struct yt921x_reg_mdio *mdio = context;
@@ -2225,6 +2320,13 @@ static int yt921x_chip_reset(struct yt921x_priv *priv)
 	u32 val;
 	int res;
 
+	res = yt921x_reg_mdio_reset(priv->reg_ctx);
+	if (res) {
+		dev_err(dev, "Failed to realign SMI state machine: %i\n",
+			res);
+		return res;
+	}
+
 	res = yt921x_chip_detect(priv);
 	if (res)
 		return res;
-- 
2.53.0

