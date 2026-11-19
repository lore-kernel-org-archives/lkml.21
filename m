Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795115057;
	b=e672hPs0rw4IEQEcIohVRHfbd/4ED+0SY+Wk6q+oxyFhtHsDsUWYDD1ZCBYysPUar2lU
	 OsgblW0nWfLC6b8keIbM0dOMjXhNSrgCo4VBJWQ4SwpXZ3DuA1Df7QUHBK65V8OL7IU/K
	 4SDttmD18k7tVX63iaQ0fSYKtc8MMjUpzcYXb/qvplzfWKwjJpczr7TfWp7MFUp3sGMbl
	 aTyRpwRW07fjql/5OVMFtE2c7+GvUq+k++JVui2hFvo4dWV4Ov0ISQgONBF7tj1aJC+Ma
	 NdNDC+sZ8L+sbSoPd0nWypctPyzrzqJAP6hBgvUfs152APCjxDg2P+8BImZDHw23Okw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795115057;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=QJmqYSINBFIg+HZP7Om7C/6gGEbzaQfQG6G6UpClr4I=;
	b=kjus6iG7zn2SDztKDDvLsz/PhZlYIJSDkg+oI/p8zGHeiVZkMCJ/kIQmngEHiMExcq4e
	 Ok14T1JMEG4wIbVU8URHsaGsxXLh4BXkLpoJKRxL9jc6pkTps67uyGbpOIS4xoL2YGmHo
	 XbCkr3hCORIgcPu9Rc4VwlRiVryWrSz5KVKhvxxZODDO6KLx55yRkkFVMmV7jnn0um1uS
	 9T0yp1guG2hTAEpUWv1adtQNfKKaEx1d7w0LKgUvB1raSpHhXVFpRQZbzOnLydbpu3L9p
	 Zy9yU4xeeAh8Cvx2c1XSeWO504EqQstNtcEa1A3zHhONOPP5UizTMpQ/wVwvX+u/c/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b="HA/3/Nhm";
	arc=none smtp.remote-ip=209.85.216.97
Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5951360A3814
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 19:04:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5951360A3814
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=HA/3/Nhm
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-3ac78f4c10bso81962a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 11:04:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795115057; x=1795719857;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QJmqYSINBFIg+HZP7Om7C/6gGEbzaQfQG6G6UpClr4I=;
        b=JseoknNLRFjmqgJVOBMfm0970d8AC+9YbU49foKPyC9k86K8eE+GUrBvBlyQz/NSPB
         i9n+N2l5udcm6Dj3vDmeBnzo02qcpqSB4RbocBFUEC7OPgyd8wIHoE3Sz01rE+b/Wn5Y
         l49T8ev8+KpJeNO1F1PAZh/Yb2qxWMmyPhPkQr2TGcmwwIQoYnkpnW/e5Lbbx/lmACAs
         gc3joxQVe7QHiLuWPOL7e6g1c6JRyZ3wKSmBhRhphHx240G0FAcLbYrlw3QFmQwDf49A
         3gDzf8V+qLL/dmbN6Hig7mVQOz/wpVOeuOI73cFIooU1JWQhIVxRtSew2WWHj6Chzaig
         exUQ==
X-Forwarded-Encrypted: i=1; AL+hErG3tNG++mKhET1jQ9EMme47yO+LCYPVvQ24GC/a7Oj2gyyrHnjrnLTif2wQ52BRTHgRaoHL6o9YIEEKcvY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9gIn+G7PHZKtFJvhqmlnF/sEfTUszlt/7qoch1Ot+ijMHJya0f
	R+43nnyCSoRzPT73Xbq0p7lk92ZfU6UGh3d4udeyKLnH6z+3Wnmo+1qbxa5PnK2rVOfSZvaWa5Q
	Qwmd8k4YiCKLxTk5tSbSEyCYrrbOdUj85hKcm2v02amnutRuefWMv4ELc2MLnbbMX5d3jMNWIuI
	FvnABpTg5CweWWntnn39AWX9oltnQ+bv3qUxD+ivBaxCNQoWYxkGBjnhBeHZCd95mb7yxzUf3yI
	OWYa4Aj8Ik9SGrP847YCHOH
X-Gm-Gg: AZFdTZca2+MDLjXpgKEEJfbGpmQRRE36OF2LuTxJdvhLwEybEg5qywxJoLioxCQ4oOD
	J5PLpbZL1s/7FZgWmXPgTdnOqptOcrt88aq3a+u45h/fZgm08tqaBHoi2K1EwaAeXpmCxzUFJFb
	zn/y8u77SK5+UD99XCPirF0rxLg3v2/geWmEm0aPZqhkghVIzxf7yr92spIkXT8yptDfP60pYZr
	eafnBMr3Eqpxbsh3sUlL2BfU/PYEMdohSy6knADcr5X3XitQSZMrCaJf8V4nN/rnMn9XgW+zf5b
	XU9aWnhR+ZfatgLT+MPX717HpA0cy8fYb/FBXpcy1Bp1sJSOs1Bh+N9mtg949xKAa9OLseHC4Lc
	+CHFea2CjKjko6PVv2l9zagc4mPd/T+1Pmg/wu+Jp3WunUp/6xye0J8RvVrPqs2CRldTTblN2bC
	4tJe1B9xiA4uKR7pBAYvpRoK4v6Zvd5eCkkwy2ZffiOCo=
X-Received: by 2002:a17:90b:3f43:b0:3ad:43c1:7d41 with SMTP id 98e67ed59e1d1-3b41c9080f2mr256854a91.33.1795115056617;
        Thu, 19 Nov 2026 11:04:16 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b41add89d3sm285666a91.4.2026.11.19.11.04.15
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Nov 2026 11:04:16 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9495c71055bso20472085a.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 11:04:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795115055; x=1795719855; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QJmqYSINBFIg+HZP7Om7C/6gGEbzaQfQG6G6UpClr4I=;
        b=HA/3/NhmYMNlPtI6zo5YsfMsdFQSTWa0WMGVNvBDiFY0i61/zKXaX/9AsdlVWA85Kk
         nzwXL8/oQ5kckuTT69yxr0AfvWYAH5uibU5ftMi37eH4dUCQePbKf+jgq33P4ANUM9jA
         dI//2NauaMApYY+6YnPMY9qsRhuJ3wvqe6Bj8=
X-Forwarded-Encrypted: i=1; AL+hErGmiIwjAYGZb3w0vR6Tb5YnWuts5JYDFKyX7n0C1+aY/0oD/yc9+q/iO2JyKSAz/naVi03L+wznhk+Eodg=@vger.kernel.org
X-Received: by 2002:a05:620a:2550:b0:949:70ec:7e98 with SMTP id af79cd13be357-949baa13290mr99007285a.40.1795115054767;
        Thu, 19 Nov 2026 11:04:14 -0800 (PST)
X-Received: by 2002:a05:620a:2550:b0:949:70ec:7e98 with SMTP id af79cd13be357-949baa13290mr98998185a.40.1795115054234;
        Thu, 19 Nov 2026 11:04:14 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb3f7cf3sm24063285a.31.2026.11.19.11.04.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 11:04:13 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonas Gorski <jonas.gorski@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vivien Didelot <vivien.didelot@gmail.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net v7 5/6] net: dsa: b53: fix mirror port encoding on BCM5325 and BCM5365
Date: Thu, 19 Nov 2026 11:03:47 -0800
Message-ID: <20261119190348.2317702-6-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261119190348.2317702-1-florian.fainelli@broadcom.com>
References: <20261119190348.2317702-1-florian.fainelli@broadcom.com>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

BCM5325 and BCM5365 use an 11-bit bitmap for the mirror capture port,
whereas newer switches use a four-bit port ID. Programming the port
number directly can select no destination or the wrong destination, and
can select multiple destinations. For example, port 2 requires BIT(2),
but writing 2 selects port 1 instead.

Use the bitmap encoding on BCM5325 and BCM5365, including translating
logical CPU port 5 to hardware bit 8. Apply the corresponding field mask
when checking for a conflicting destination, replacing the destination,
and clearing it after the last mirror source is removed. Keep the port ID
encoding for newer switches.

The ingress and egress mirror source masks use the same layout on these
switches, with the CPU port at bit 8 and bits 5-7 reserved, so apply the
same translation when setting and clearing a source port bit.

Fixes: ed3af5fd08eb ("net: dsa: b53: Add support for port mirroring")
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/net/dsa/b53/b53_common.c | 35 +++++++++++++++++++++++++++-----
 drivers/net/dsa/b53/b53_regs.h   |  1 +
 2 files changed, 31 insertions(+), 5 deletions(-)

diff --git a/drivers/net/dsa/b53/b53_common.c b/drivers/net/dsa/b53/b53_common.c
index 19e36e51be52..ffbf5efd8d95 100644
--- a/drivers/net/dsa/b53/b53_common.c
+++ b/drivers/net/dsa/b53/b53_common.c
@@ -2604,6 +2604,31 @@ enum dsa_tag_protocol b53_get_tag_protocol(struct dsa_switch *ds, int port,
 }
 EXPORT_SYMBOL(b53_get_tag_protocol);
 
+static u16 b53_mirror_capture_port_mask(struct b53_device *dev)
+{
+	if (is5325(dev) || is5365(dev))
+		return CAP_PORT_MASK_25;
+
+	return CAP_PORT_MASK;
+}
+
+static u16 b53_mirror_port_mask(struct b53_device *dev, int port)
+{
+	/* These switches use a bitmap with the CPU port at bit 8. */
+	if ((is5325(dev) || is5365(dev)) && port == B53_CPU_PORT_25)
+		port = B53_CPU_PORT;
+
+	return BIT(port);
+}
+
+static u16 b53_mirror_capture_port(struct b53_device *dev, int port)
+{
+	if (is5325(dev) || is5365(dev))
+		return b53_mirror_port_mask(dev, port);
+
+	return port;
+}
+
 int b53_mirror_add(struct dsa_switch *ds, int port,
 		   struct dsa_mall_mirror_tc_entry *mirror, bool ingress,
 		   struct netlink_ext_ack *extack)
@@ -2617,12 +2642,12 @@ int b53_mirror_add(struct dsa_switch *ds, int port,
 		loc = B53_EG_MIR_CTL;
 
 	b53_read16(dev, B53_MGMT_PAGE, loc, &reg);
-	reg |= BIT(port);
+	reg |= b53_mirror_port_mask(dev, port);
 	b53_write16(dev, B53_MGMT_PAGE, loc, reg);
 
 	b53_read16(dev, B53_MGMT_PAGE, B53_MIR_CAP_CTL, &reg);
-	reg &= ~CAP_PORT_MASK;
-	reg |= mirror->to_local_port;
+	reg &= ~b53_mirror_capture_port_mask(dev);
+	reg |= b53_mirror_capture_port(dev, mirror->to_local_port);
 	reg |= MIRROR_EN;
 	b53_write16(dev, B53_MGMT_PAGE, B53_MIR_CAP_CTL, reg);
 
@@ -2644,7 +2669,7 @@ void b53_mirror_del(struct dsa_switch *ds, int port,
 
 	/* Update the desired ingress/egress register */
 	b53_read16(dev, B53_MGMT_PAGE, loc, &reg);
-	reg &= ~BIT(port);
+	reg &= ~b53_mirror_port_mask(dev, port);
 	if (!(reg & MIRROR_MASK))
 		loc_disable = true;
 	b53_write16(dev, B53_MGMT_PAGE, loc, reg);
@@ -2663,7 +2688,7 @@ void b53_mirror_del(struct dsa_switch *ds, int port,
 	/* Both no longer have ports, let's disable mirroring */
 	if (loc_disable && other_loc_disable) {
 		reg &= ~MIRROR_EN;
-		reg &= ~mirror->to_local_port;
+		reg &= ~b53_mirror_capture_port_mask(dev);
 	}
 	b53_write16(dev, B53_MGMT_PAGE, B53_MIR_CAP_CTL, reg);
 }
diff --git a/drivers/net/dsa/b53/b53_regs.h b/drivers/net/dsa/b53/b53_regs.h
index cfdb5ed38326..ee049927a63a 100644
--- a/drivers/net/dsa/b53/b53_regs.h
+++ b/drivers/net/dsa/b53/b53_regs.h
@@ -239,6 +239,7 @@
 /* Mirror capture control register (16 bit) */
 #define B53_MIR_CAP_CTL			0x10
 #define  CAP_PORT_MASK			0xf
+#define  CAP_PORT_MASK_25		0x7ff
 #define  BLK_NOT_MIR			BIT(14)
 #define  MIRROR_EN			BIT(15)
 
-- 
2.53.0

