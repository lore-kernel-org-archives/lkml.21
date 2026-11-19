Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795115059;
	b=PyiZ1J/hIaUjywnq4kzxjWFDh7ugWTCn15JU7wnVpQhIb2ZRFwxmu9nwJ2HXbt2JGzYR
	 8j9xSdaSgX1bA6BydFGNqlcVKpOuigAlSum/UQhQ4v0vKsSMqqmE+vsfTJanrvnitKEJM
	 9kM6la3YI+3CsMa3VfDQj77n4HZ8DRdSyZ5FGB9gQTOQHK6jICDuYPFBmrTXUVQz6flKR
	 a90P3o7/XCvfwhQYvq5hX09yKbZoHFOgf2B5pdXedDLJ4mYvdos07Llo39ZHGv61KhZFm
	 Grfba9IZyWk9gGfsofR4bUDZIHEZU6rhujjA7s04GvKJo20k9WCocF9u2XnEUORbi7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795115059;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=NC6+Hq88/BH5lKJOETgjBF4IywFyoVJ5dO49DTkcORE=;
	b=mAYR2Q7dbQNX9cVpLGj/rTuHEgsIfVodZYYt9mkL1GSGeZC8zTVuC6wt0mkvTAgMwCUS
	 rMH07Tzu4taD7mtvXTtPDD/UGUMXlDV431AkFHFgmeQTTbPWA5Ik8Eyw7jaI4CPORPv21
	 zaoOi0QmoLZJaC2j0QxUGmEDPggsoDTYQecI/vrJbKoRpcsEk8Fe18Xq5TUEUTQvlc19d
	 vRGwu4QJcwJc5AjnKH5vlJ+3Rrv9QQdwz2THv02UZD60Ku8nprUHwsETqVjSsMIoIcLa6
	 cC8cqMCfNHxa2VrqxIOOlPj8f1aeJ+u5JrdDzi7usRis53BPI31IKGiCR7g2wcwQ8FQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=UJMd3Q5r;
	arc=none smtp.remote-ip=209.85.216.100
Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D06460A381E
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 19:04:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D06460A381E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=UJMd3Q5r
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-3adac5b29ebso92615a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 11:04:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795115058; x=1795719858;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NC6+Hq88/BH5lKJOETgjBF4IywFyoVJ5dO49DTkcORE=;
        b=PtPYADpZJ2zor5JL0FQjZgWjHdb5WtG3gB0PTIhU250mehtPLb9M1dqkr2ztfVk0Y8
         OgW3v5oYMFPAl/2TyYQnuaF54uXnhMi02yxdcrD1VFMEhT6mtQ0rD+JmZRgSTG0VnFAM
         a9yPKLUOfNEB3FSm5fPIdUFMzSAHkvBLN+q5UYZCMdT99pagKUsBW3p9D9klLI2GbEow
         xrfhCwoKmBexAiZ8uqRhLHAdDBHrg64Pnv5DIEQditoAfz5sqbd0SKBo7zvWS5/0HX6S
         KhLxZ598fc/1k8iTqJa4hncqwdDAyF2CB8zC3d1WUQdxi+wJiI/NMSE4fP9sQU+Ma+s7
         73aA==
X-Forwarded-Encrypted: i=1; AL+hErEXo6Bf5LFjL0CmIIrftMGezyHTVThRPYT8wxEgrgWXXLqF9GZJ9Zrpb5Tr8CgPyokSk44sSvni3ZHjMbY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/7KAvBFLFASSDLHELVRsXK3OKdSQPxA7DABJcZxmR3e6rjRkNs
	oeErinCpQzQW4ySqdPs+DT7YReVbaehAgC7X1slZR6iikVs30BQJtJ8AON1ao0PJm2xIygx4qux
	faYWaNXeUSabdBZehRCq2/PSg7HUPdqdqv2axbmKbu7CVa96Kh84CjRv19V4kw26TBo2gOiFcNr
	ADbOH6PbmW7dmI4MOcwbm75HhbIAqN0I4qQ5iKBrc+DjhSHGrJSoXC3Q4/RyOr5PLTCUk7Wly/o
	IyNp7/SJcaTw7ZKLiBJSl7Z
X-Gm-Gg: AZFdTZehsWg2sVKrogk8iRJj1piwDBG3zgDba869cXoUwxt6KcoR75ACnZ3VVo3GFh9
	l44uAAoOgwdKh0+J4PnSDEot4Hq7uAMFpf1o8HsXlntGQcKk5IvU6J5LWBoSL8W3l1ZnPzZwKgt
	DJ4Lo9nQW/eGhlwxzmFL1IXhFpg+K05b3k3zhLJogv/0BHPvRYWrDh3+F9Q0tarQeKOCXzvPidO
	hfWPBRQp/np/+vAZDvj0P6eoNQ8YI1yIUF9bGFpjgi4nEQw2o92gaFB7K2AIt8HF7tAJizX241N
	O7Wn5LTuNyaEBSbmRzg857jHP0EFj5IUkyIDXu1pwJWrzV/GvcDxMfx44ZQCcRsHqxFfKyVulhw
	WT7ZcKLBvf4Q4U9EarTpnWPzhyRvbu6Vsm9i/Z9qrxylThPoRmt27KysNgplKsFYCfXhFjsiVWX
	xDMUmUgMwqi+U0yijjrW3XQhrM3nSGJnj633qXT2uj
X-Received: by 2002:a17:90b:5543:b0:3a4:f75d:d194 with SMTP id 98e67ed59e1d1-3b41caeca54mr241930a91.36.1795115058555;
        Thu, 19 Nov 2026 11:04:18 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b41d23b83fsm42275a91.3.2026.11.19.11.04.18
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Nov 2026 11:04:18 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9308eafb465so24148685a.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 11:04:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795115057; x=1795719857; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NC6+Hq88/BH5lKJOETgjBF4IywFyoVJ5dO49DTkcORE=;
        b=UJMd3Q5rZdzZHG/nayU2UUw0lAMYd7qsdEoMWzRnDoiBNR0rzN17xYvW1AO5lBKCmW
         MUFElF4bNe3AFVyBxzgSfBNx46MeH9gv/sm/UyXA19O+/JSjVgKDd639z80yiS1RaQ//
         GWIkdxmh+CuSzAMHQ0cinmNCDIgygfgLhBmjs=
X-Forwarded-Encrypted: i=1; AL+hErEsXryWX/Q4gwBEHKV/bqXCJEABK5Mz+BWbdQsQ3tcPQPKZmxYR8DWwMOhufShm5FbYBarxwB5yGAcgSOE=@vger.kernel.org
X-Received: by 2002:a05:620a:1332:b0:949:402b:f1b3 with SMTP id af79cd13be357-949bab3e8f5mr75780285a.70.1795115057096;
        Thu, 19 Nov 2026 11:04:17 -0800 (PST)
X-Received: by 2002:a05:620a:1332:b0:949:402b:f1b3 with SMTP id af79cd13be357-949bab3e8f5mr75773285a.70.1795115056445;
        Thu, 19 Nov 2026 11:04:16 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb3f7cf3sm24063285a.31.2026.11.19.11.04.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 11:04:15 -0800 (PST)
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
Subject: [PATCH net v7 6/6] net: dsa: b53: fix mirror destination and source state tracking
Date: Thu, 19 Nov 2026 11:03:48 -0800
Message-ID: <20261119190348.2317702-7-florian.fainelli@broadcom.com>
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

The mirror capture control register selects one destination for all
ingress and egress sources. Adding a rule for another destination
currently redirects existing rules. Multiple matchall filters can also
share one source bit, but deleting any one of them clears that bit and
can disable mirroring while other filters still need it.

Reject a different destination while either source mask is occupied, and
reference count each port's ingress and egress source bit under RTNL.
Program a source on its first reference and clear it on its last one.
Check every mirror register access and record a first reference only
after programming succeeds. Select the destination before enabling the
source, and log deletion failures because the callback returns no error.
Use the source masks to retain the destination after a failed source
deletion and allow a new destination after a failed capture-control clear.

Not all supported switches receive a hardware reset during setup, so
clear stale capture and source registers before accepting mirror rules.
Introduce b53_mirror_init() together with its b53 and bcm_sf2 setup
callers. Rebuild active sources and their destination from the reference
counts when setup runs again, preserving rules across bcm_sf2 resume.
Propagate initialization failures instead of accepting stale state.

This depends on "net: dsa: b53: fix mirror port encoding on BCM5325 and
BCM5365" for the chip-specific source and capture-port helpers.

Fixes: ed3af5fd08eb ("net: dsa: b53: Add support for port mirroring")

Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/net/dsa/b53/b53_common.c | 168 ++++++++++++++++++++++++-------
 drivers/net/dsa/b53/b53_priv.h   |   4 +
 drivers/net/dsa/bcm_sf2.c        |   4 +
 3 files changed, 140 insertions(+), 36 deletions(-)

diff --git a/drivers/net/dsa/b53/b53_common.c b/drivers/net/dsa/b53/b53_common.c
index ffbf5efd8d95..ee2d27732c0c 100644
--- a/drivers/net/dsa/b53/b53_common.c
+++ b/drivers/net/dsa/b53/b53_common.c
@@ -1360,6 +1360,10 @@ static int b53_setup(struct dsa_switch *ds)
 		return ret;
 	}
 
+	ret = b53_mirror_init(ds);
+	if (ret)
+		return ret;
+
 	/* setup default vlan for filtering mode */
 	pvid = b53_default_pvid(dev);
 	vl = &dev->vlans[pvid];
@@ -2629,27 +2633,103 @@ static u16 b53_mirror_capture_port(struct b53_device *dev, int port)
 	return port;
 }
 
+int b53_mirror_init(struct dsa_switch *ds)
+{
+	struct b53_device *dev = ds->priv;
+	u16 ingress = 0, egress = 0, cap_ctl = 0;
+	unsigned int port;
+	int ret;
+
+	/* A switch reset may leave the previous mirror configuration intact. */
+	ret = b53_write16(dev, B53_MGMT_PAGE, B53_MIR_CAP_CTL, 0);
+	if (ret)
+		return ret;
+
+	ret = b53_write16(dev, B53_MGMT_PAGE, B53_IG_MIR_CTL, 0);
+	if (ret)
+		return ret;
+
+	ret = b53_write16(dev, B53_MGMT_PAGE, B53_EG_MIR_CTL, 0);
+	if (ret)
+		return ret;
+
+	/* DSA retains matchall filters across suspend and resume. */
+	for (port = 0; port < dev->num_ports; port++) {
+		if (dev->ports[port].mirror_count[true])
+			ingress |= b53_mirror_port_mask(dev, port);
+		if (dev->ports[port].mirror_count[false])
+			egress |= b53_mirror_port_mask(dev, port);
+	}
+
+	if (!(ingress | egress))
+		return 0;
+
+	cap_ctl = MIRROR_EN | b53_mirror_capture_port(dev, dev->mirror_port);
+	ret = b53_write16(dev, B53_MGMT_PAGE, B53_MIR_CAP_CTL, cap_ctl);
+	if (ret)
+		return ret;
+
+	ret = b53_write16(dev, B53_MGMT_PAGE, B53_IG_MIR_CTL, ingress);
+	if (ret)
+		return ret;
+
+	return b53_write16(dev, B53_MGMT_PAGE, B53_EG_MIR_CTL, egress);
+}
+EXPORT_SYMBOL(b53_mirror_init);
+
 int b53_mirror_add(struct dsa_switch *ds, int port,
 		   struct dsa_mall_mirror_tc_entry *mirror, bool ingress,
 		   struct netlink_ext_ack *extack)
 {
 	struct b53_device *dev = ds->priv;
-	u16 reg, loc;
+	unsigned int *mirror_count = &dev->ports[port].mirror_count[ingress];
+	u16 reg, other_reg, loc, other_loc, cap_ctl;
+	u16 cap_mask = b53_mirror_capture_port_mask(dev);
+	u16 cap_port = b53_mirror_capture_port(dev, mirror->to_local_port);
+	int ret;
 
-	if (ingress)
-		loc = B53_IG_MIR_CTL;
-	else
-		loc = B53_EG_MIR_CTL;
+	loc = ingress ? B53_IG_MIR_CTL : B53_EG_MIR_CTL;
+	other_loc = ingress ? B53_EG_MIR_CTL : B53_IG_MIR_CTL;
 
-	b53_read16(dev, B53_MGMT_PAGE, loc, &reg);
-	reg |= b53_mirror_port_mask(dev, port);
-	b53_write16(dev, B53_MGMT_PAGE, loc, reg);
+	ret = b53_read16(dev, B53_MGMT_PAGE, loc, &reg);
+	if (ret)
+		return ret;
 
-	b53_read16(dev, B53_MGMT_PAGE, B53_MIR_CAP_CTL, &reg);
-	reg &= ~b53_mirror_capture_port_mask(dev);
-	reg |= b53_mirror_capture_port(dev, mirror->to_local_port);
-	reg |= MIRROR_EN;
-	b53_write16(dev, B53_MGMT_PAGE, B53_MIR_CAP_CTL, reg);
+	ret = b53_read16(dev, B53_MGMT_PAGE, other_loc, &other_reg);
+	if (ret)
+		return ret;
+
+	ret = b53_read16(dev, B53_MGMT_PAGE, B53_MIR_CAP_CTL, &cap_ctl);
+	if (ret)
+		return ret;
+
+	if (((reg | other_reg) & MIRROR_MASK) &&
+	    (cap_ctl & cap_mask) != cap_port) {
+		NL_SET_ERR_MSG_MOD(extack,
+				   "Only one mirroring destination is supported");
+		return -EOPNOTSUPP;
+	}
+
+	if (*mirror_count) {
+		(*mirror_count)++;
+		return 0;
+	}
+
+	/* Select the destination before enabling the new source. */
+	cap_ctl &= ~cap_mask;
+	cap_ctl |= cap_port;
+	cap_ctl |= MIRROR_EN;
+	ret = b53_write16(dev, B53_MGMT_PAGE, B53_MIR_CAP_CTL, cap_ctl);
+	if (ret)
+		return ret;
+
+	ret = b53_write16(dev, B53_MGMT_PAGE, loc,
+			  reg | b53_mirror_port_mask(dev, port));
+	if (ret)
+		return ret;
+
+	(*mirror_count)++;
+	dev->mirror_port = mirror->to_local_port;
 
 	return 0;
 }
@@ -2659,38 +2739,54 @@ void b53_mirror_del(struct dsa_switch *ds, int port,
 		    struct dsa_mall_mirror_tc_entry *mirror)
 {
 	struct b53_device *dev = ds->priv;
-	bool loc_disable = false, other_loc_disable = false;
-	u16 reg, loc;
+	unsigned int *mirror_count =
+		&dev->ports[port].mirror_count[mirror->ingress];
+	u16 reg, other_reg, loc, other_loc;
+	int ret;
 
-	if (mirror->ingress)
-		loc = B53_IG_MIR_CTL;
-	else
-		loc = B53_EG_MIR_CTL;
+	if (!*mirror_count)
+		return;
+
+	if (--(*mirror_count))
+		return;
+
+	loc = mirror->ingress ? B53_IG_MIR_CTL : B53_EG_MIR_CTL;
+	other_loc = mirror->ingress ? B53_EG_MIR_CTL : B53_IG_MIR_CTL;
 
 	/* Update the desired ingress/egress register */
-	b53_read16(dev, B53_MGMT_PAGE, loc, &reg);
+	ret = b53_read16(dev, B53_MGMT_PAGE, loc, &reg);
+	if (ret)
+		goto err;
+
 	reg &= ~b53_mirror_port_mask(dev, port);
-	if (!(reg & MIRROR_MASK))
-		loc_disable = true;
-	b53_write16(dev, B53_MGMT_PAGE, loc, reg);
+	ret = b53_write16(dev, B53_MGMT_PAGE, loc, reg);
+	if (ret)
+		goto err;
 
 	/* Now look at the other one to know if we can disable mirroring
 	 * entirely
 	 */
-	if (mirror->ingress)
-		b53_read16(dev, B53_MGMT_PAGE, B53_EG_MIR_CTL, &reg);
-	else
-		b53_read16(dev, B53_MGMT_PAGE, B53_IG_MIR_CTL, &reg);
-	if (!(reg & MIRROR_MASK))
-		other_loc_disable = true;
+	ret = b53_read16(dev, B53_MGMT_PAGE, other_loc, &other_reg);
+	if (ret)
+		goto err;
 
-	b53_read16(dev, B53_MGMT_PAGE, B53_MIR_CAP_CTL, &reg);
-	/* Both no longer have ports, let's disable mirroring */
-	if (loc_disable && other_loc_disable) {
-		reg &= ~MIRROR_EN;
-		reg &= ~b53_mirror_capture_port_mask(dev);
-	}
-	b53_write16(dev, B53_MGMT_PAGE, B53_MIR_CAP_CTL, reg);
+	if ((reg | other_reg) & MIRROR_MASK)
+		return;
+
+	ret = b53_read16(dev, B53_MGMT_PAGE, B53_MIR_CAP_CTL, &reg);
+	if (ret)
+		goto err;
+
+	reg &= ~(MIRROR_EN | b53_mirror_capture_port_mask(dev));
+	ret = b53_write16(dev, B53_MGMT_PAGE, B53_MIR_CAP_CTL, reg);
+	if (ret)
+		goto err;
+
+	return;
+
+err:
+	dev_err(dev->dev, "Failed to delete mirror rule for port %d: %d\n",
+		port, ret);
 }
 EXPORT_SYMBOL(b53_mirror_del);
 
diff --git a/drivers/net/dsa/b53/b53_priv.h b/drivers/net/dsa/b53/b53_priv.h
index c4d2a41c714f..df00a5ae46c9 100644
--- a/drivers/net/dsa/b53/b53_priv.h
+++ b/drivers/net/dsa/b53/b53_priv.h
@@ -119,6 +119,8 @@ struct b53_pcs {
 #define B53_N_PCS	2
 
 struct b53_port {
+	/* References to each egress/ingress mirror source mask bit. */
+	unsigned int mirror_count[2];
 	u16		vlan_ctl_mask;
 	u16		pvid;
 	struct ethtool_keee eee;
@@ -170,6 +172,7 @@ struct b53_device {
 
 	/* run time configuration */
 	bool enable_jumbo;
+	unsigned int mirror_port;
 
 	unsigned int num_vlans;
 	struct b53_vlan *vlans;
@@ -545,6 +548,7 @@ int b53_mdb_add(struct dsa_switch *ds, int port,
 int b53_mdb_del(struct dsa_switch *ds, int port,
 		const struct switchdev_obj_port_mdb *mdb,
 		struct dsa_db db);
+int b53_mirror_init(struct dsa_switch *ds);
 int b53_mirror_add(struct dsa_switch *ds, int port,
 		   struct dsa_mall_mirror_tc_entry *mirror, bool ingress,
 		   struct netlink_ext_ack *extack);
diff --git a/drivers/net/dsa/bcm_sf2.c b/drivers/net/dsa/bcm_sf2.c
index 1747a1f20c78..cbaa5de9b107 100644
--- a/drivers/net/dsa/bcm_sf2.c
+++ b/drivers/net/dsa/bcm_sf2.c
@@ -1061,6 +1061,10 @@ static int bcm_sf2_sw_setup(struct dsa_switch *ds)
 	unsigned int port;
 	int ret;
 
+	ret = b53_mirror_init(ds);
+	if (ret)
+		return ret;
+
 	/* Enable all valid ports and disable those unused */
 	for (port = 0; port < priv->hw_params.num_ports; port++) {
 		/* IMP port receives special treatment */
-- 
2.53.0

