Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795546713;
	b=UBv4lt3IP7V1ZI4gs6D3ckVqS+KozikcOLmJOvKlo646KKDN27kycEkPfHPDGuH8zMEX
	 iYDQR9jEl31TEdUMPx5jHSSbwT4QUjS0+EQGuOA064LOSpucPqMCQEwRH1R0I3jhIlWGv
	 p0yJZKJxL4xdO9Np9GP3mTT/Hb4Absml2xVB5HnNCdNvW9V4VGlp3W11y74Jrzy09/gEb
	 srOYm5huUfJV1BtZ2KmbCVQFmuTh49naCY5Diakg9KES6x1TON7w7Y5rYp+uYn87/CvnO
	 UtkQ0AinlM/FuKz7Mi31qUVFHgUfGVuGwZx/fnoH1a8jmuLuajKwNVRFKgm/WcNbIZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795546713;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=quBmEvssoIq+k9UatqjHYNevuhuRtNF9HPhUjS1B/Ls=;
	b=Y4jY5FOP5lY25nL9HIIIWJaLF1YV9/XlWvTdfEM47ziNQbSa0I499lqdV7/mD3wRFUiL
	 dPRWzm44etQtTw0bar2aM2bGfuzRzPqgdf3C2IJMEVVoirKRQlSzolLFwRbqJxjS5emzl
	 61ekRqai6mcQdqnmUHDpQW3M40q/hpqAB3ELRRyF9jtaIDvDZtpOiA0zY8L9q7n64RICL
	 UOTGQiH4J8C2bpMkpdSWyHPwpvg2adLYhRNvjlXv2+rwh8BrZNEkD4BR1UF4L9TxSO5qm
	 JqpR1z9ZSi3e17YSs1GwJQPw4DdQCF2e8lQY3RWRwii0/sdQ+ELE5Hq0GWbqUIV9L4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=dbZZv5BW;
	arc=none smtp.remote-ip=209.85.222.227
Received: from mail-qk1-f227.google.com (mail-qk1-f227.google.com [209.85.222.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE59606A329
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 18:58:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9EE59606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=dbZZv5BW
Received: by mail-qk1-f227.google.com with SMTP id af79cd13be357-94961bfe1a0so321575785a.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 10:58:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795546711; x=1796151511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=quBmEvssoIq+k9UatqjHYNevuhuRtNF9HPhUjS1B/Ls=;
        b=ofm4jePvIRVMIa9l7rYNwCZ5emM0UQzxpSI+bERGy6oyfTrodjOPHjMIcAEouO7kbq
         27gOgl+9D9+3wBl0tHaW9I6DB34fdJxHkk7TuRYaoW+tzJX+/uY61QZF0H6RyeIJsy9n
         ZQd6svDPgm+SOVgzcg5T/MJvHKfBQmEyNtIn2htjPx6NWV0zmytYP3n6nwHBjHR/jNqe
         Z0KcgILBjTNceosAoQg71PGGsG6k90OsY+hWuYas0oxZHfw8FDDwGa1Szgum5iI8snK0
         O0YgNlrRkwaEnwYUZzyytQBFcwSnkqeQ1+PcbXF+LqFlfbDqO1+aPysLHV995Jvkmf3t
         JogA==
X-Forwarded-Encrypted: i=1; AL+hErEr49MOcDquYcmxHlp/Y12m3Boc8Qd3A+/NI4sBXUcLWEw2csUpdWvgbK9LLS4LtgwWe0+05gdl1bwHRDQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8zdO9TH4sxuMQMz5emgiSC7WXFX9klASKnmeMS9HvWKhhW1jwi
	baDPMIHzkeQBqWNzmZ1U6jyoMUICMDrikUVtyCkcB6uWPDXHMSPrAN0rUD6aoPe20FbgJD4cbjE
	QT++74eyH6/mZBoagyUEdaGpj2sYlhrAjpQiw+Fd5UQoqfh4Ig4cQUOsuYUmgggTZn4YlUYe2rJ
	irzhkbmy/1SyTJdDN6OiltF9UN/G4WWgOFN4qF/+bWU+qhdc+2JXFee0f0FnMGIp6jQPNnvI3zY
	fl7xev6KOwcX/3OrJMQ1EEK
X-Gm-Gg: AZFdTZdOwop8XLLuwUHwekNPFNMzxECx8cc7CqmIR3srZN3Xd8Bh2vQLA66mCCbL+4X
	3fJE6HNp+WCZ0bQMAVWhloxJ83t18EP/3XjZpZW5AdQVYdepK001UdFET/nzcK3Ns7VS4QJMuIJ
	TBtsZoGVi5CfHp+2aXYWMCzriVyGu014SOZA9lGWYLhr8Y5eNNjxFVPSxsjwYrBGqiB6uVg5W5+
	X5rNTGfhxDTsv8Mk9i+JmY75XhszLRIutv6noJqWiIZu7xz8p7PytVQUcbITpAya7rh8pksEy/e
	+pm6hy2tSn5xfPUOS0DAAunRzG5uDj9AJzEnLPniZ5JKVVia50fE0CvXn/j7CmTRlEYFGG9kWt4
	cXCpL3kkKSSDo3AuscRGhSJwZtnAzL3+HdWdYNdRa9VZ1aKKvoO+jZyR/8d4AQB90Kgj3+xHnq0
	Y3pJtr/xiirISllAf550yfNvNv9qBI19Jb/naNFdwTtEU=
X-Received: by 2002:a05:620a:130d:b0:943:f301:49b9 with SMTP id af79cd13be357-949bab32ac3mr2451948985a.53.1795546711303;
        Tue, 24 Nov 2026 10:58:31 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id af79cd13be357-949baed3b2asm111590485a.0.2026.11.24.10.58.30
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Nov 2026 10:58:31 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1b3b45597c7so6206004c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 10:58:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795546709; x=1796151509; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=quBmEvssoIq+k9UatqjHYNevuhuRtNF9HPhUjS1B/Ls=;
        b=dbZZv5BWl2tBxh3X2gf4/mQoyyfdlCwzS4vl4tY4G8KL8AKrGWk6F4OHbF1CEJ88QM
         /X/uDSbdVXe6hhoWRyIcBCEii0YsMH/OmEimW0iaAg3yz1NHPR92lX/NCgXWVazHhBTr
         B7c5c7VMsaJO9mBiTAyzUlbdLaAIO/7Aoq77Y=
X-Forwarded-Encrypted: i=1; AL+hErHpJELzOABN2yum9cADTKO9fjCF6UY+nKp6ycY/suhduK8wkYStpuJOvt1R4HB0pwCciLJesj9I0sHZKb8=@vger.kernel.org
X-Received: by 2002:a05:7022:38b:b0:1b5:2dce:1b6d with SMTP id a92af1059eb24-1b55689ab30mr18357599c88.17.1795546708858;
        Tue, 24 Nov 2026 10:58:28 -0800 (PST)
X-Received: by 2002:a05:7022:38b:b0:1b5:2dce:1b6d with SMTP id a92af1059eb24-1b55689ab30mr18357526c88.17.1795546707818;
        Tue, 24 Nov 2026 10:58:27 -0800 (PST)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556847fdasm41712779c88.13.2026.11.24.10.58.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 10:58:27 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Doug Berger <opendmb@gmail.com>,
	Nicolai Buchwitz <nb@tipi-net.de>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org (open list),
	Mlody12 mlody12 <kudzo51@gmail.com>
Subject: [PATCH net-next v7 1/4] net: phy: Map C45 probe read errors to -ENODEV during bus scan
Date: Tue, 24 Nov 2026 10:58:17 -0800
Message-Id: <20261124185820.3954716-2-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261124185820.3954716-1-florian.fainelli@broadcom.com>
References: <20261124185820.3954716-1-florian.fainelli@broadcom.com>
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

get_phy_c22_id() maps a bus read error of -EIO or -ENODEV to -ENODEV, so
that mdiobus_scan_bus_c22() carries on with the next address when nothing
answers. get_phy_c45_ids() only does so for phy_c45_probe_present(); a
failed read of the devices in package registers is turned into -EIO, which
mdiobus_scan_bus_c45() treats as fatal and which makes the whole
__mdiobus_register() fail.

MDIO controllers that report a read from an empty address as a bus error
(e.g. MDIO_READ_FAIL on the UniMAC MDIO block) and that provide read_c45()
with unmasked addresses therefore cannot be registered: the C45 scan fails
on the first empty address. mdio-bcm-unimac does not provide read_c45()
yet, this is enabled by "net: mdio: mdio-bcm-unimac: Add Clause 45
support" later in this series.

Make get_phy_c45_devs_in_pkg() apply the same mapping as get_phy_c22_id()
to its first read (MDIO_DEVS2): a failure with -EIO or -ENODEV there means
that nothing answered and is reported as -ENODEV. A failure of the second
read (MDIO_DEVS1) happens once the first one succeeded, i.e. once the MMD
has answered, and is still reported as -EIO so that the PHY is not silently
skipped.

get_phy_c45_ids() then handles -ENODEV in the two places that look for a
device at an address: the loop over the MMDs and the MMD 0 fallback. In the
loop, an MMD that does not answer is handled like one that reads as all Fs,
except that the remaining MMDs are not probed: the scan goes straight to
MMD 0, and -ENODEV is only returned if that does not answer either, so PHYs
that only respond on MMD 0 are still found while an empty address costs a
bounded number of bus reads. Carrying on with the remaining MMDs is not an
option: the vendor MMD presence check done on the way fails with the same
bus error on such a controller and ends the scan before MMD 0 is reached.

This patch does not change how the other errors are reported: the vendor
MMD presence check done while reading the identifiers and the reads of the
per-MMD identifiers themselves only happen once a device has answered, and
their error is returned as is. The kernel-doc therefore documents "a
negative error code" rather than -EIO as the only alternative.

This is not limited to mdiobus_scan_bus_c45(): get_phy_c45_ids() is reached
through get_phy_device(bus, addr, true) and phy_get_c45_ids() by every C45
caller. For those, a failed devices in package read is now reported as
-ENODEV instead of -EIO, which is what C22 callers already get:

- fwnode_mdiobus_register_phy() for "ethernet-phy-ieee802.3-c45" nodes:
  __of_mdiobus_parse_phys() logs that the device is missing and registers
  the bus without it, instead of failing the registration.
- sfp_sm_probe_phy(): the mdio-i2c buses report a PHY that does not
  answer as a read of all Fs, so nothing changes for an absent PHY. The
  only error that can reach this code is an I2C transport error (-EIO) on
  a RollBall module: it is now handled like the -ENODEV that C22 modules
  already get, i.e. retried and, if it persists, reported as "no PHY
  detected" instead of "mdiobus scan returned -EIO" and SFP_S_FAIL.
- gpy_probe() through phy_get_c45_ids(): the driver core treats -ENODEV as
  a silent match rejection rather than a probe failure.

Fixes: 17b447539408 ("net: phy: c45 scanning: Don't consider -ENODEV fatal")
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/net/phy/phy_device.c | 37 ++++++++++++++++++++++++++++--------
 1 file changed, 29 insertions(+), 8 deletions(-)

diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index b39e945cebd7..60440b62e6c7 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -780,7 +780,11 @@ static int phy_c45_probe_present(struct mii_bus *bus, int prtad, int devad)
  * Description: reads devices in package registers of a MMD at @dev_addr
  * from PHY at @addr on @bus.
  *
- * Returns: 0 on success, -EIO on failure.
+ * Returns: 0 on success, %-ENODEV if the first read failed with -EIO or
+ * -ENODEV, which is how a controller signals that nothing answered at this
+ * address, or %-EIO on any other failure. A failure of the second read, once
+ * the first one succeeded, means that the MMD did answer and is therefore
+ * always reported as %-EIO.
  */
 static int get_phy_c45_devs_in_pkg(struct mii_bus *bus, int addr, int dev_addr,
 				   u32 *devices_in_package)
@@ -789,7 +793,10 @@ static int get_phy_c45_devs_in_pkg(struct mii_bus *bus, int addr, int dev_addr,
 
 	phy_reg = mdiobus_c45_read(bus, addr, dev_addr, MDIO_DEVS2);
 	if (phy_reg < 0)
-		return -EIO;
+		/* Like get_phy_c22_id(): returning -ENODEV doesn't stop bus
+		 * scanning
+		 */
+		return (phy_reg == -EIO || phy_reg == -ENODEV) ? -ENODEV : -EIO;
 	*devices_in_package = phy_reg << 16;
 
 	phy_reg = mdiobus_c45_read(bus, addr, dev_addr, MDIO_DEVS1);
@@ -810,8 +817,10 @@ static int get_phy_c45_devs_in_pkg(struct mii_bus *bus, int addr, int dev_addr,
  * the PHY identifiers for each device. Return the "devices in package"
  * and identifiers in @c45_ids.
  *
- * Returns zero on success, %-EIO on bus access error, or %-ENODEV if
- * the "devices in package" is invalid or no device responds.
+ * Returns zero on success, %-ENODEV if the "devices in package" is invalid or
+ * if no MMD responds (including when the bus reports -EIO or -ENODEV for the
+ * reads that look for a device), or a negative error code from a failed bus
+ * access otherwise (usually %-EIO).
  */
 static int get_phy_c45_ids(struct mii_bus *bus, int addr,
 			   struct phy_c45_device_ids *c45_ids)
@@ -844,8 +853,18 @@ static int get_phy_c45_ids(struct mii_bus *bus, int addr,
 				continue;
 		}
 		phy_reg = get_phy_c45_devs_in_pkg(bus, addr, i, &devs_in_pkg);
+		if (phy_reg == -ENODEV) {
+			/* The MMD did not answer: treat it like a read of all
+			 * Fs, which is what controllers that do not check the
+			 * turnaround return, and go straight to the MMD 0
+			 * probe below. Do not probe the remaining MMDs, each
+			 * one costs two bus reads on a slow bus.
+			 */
+			devs_in_pkg = 0xffffffff;
+			break;
+		}
 		if (phy_reg < 0)
-			return -EIO;
+			return phy_reg;
 	}
 
 	if ((devs_in_pkg & 0x1fffffff) == 0x1fffffff) {
@@ -855,7 +874,7 @@ static int get_phy_c45_ids(struct mii_bus *bus, int addr,
 		 */
 		phy_reg = get_phy_c45_devs_in_pkg(bus, addr, 0, &devs_in_pkg);
 		if (phy_reg < 0)
-			return -EIO;
+			return phy_reg;
 
 		/* no device there, let's get out of here */
 		if ((devs_in_pkg & 0x1fffffff) == 0x1fffffff)
@@ -1077,8 +1096,10 @@ EXPORT_SYMBOL(phy_device_remove);
  * phy_get_c45_ids - Read 802.3-c45 IDs for phy device.
  * @phydev: phy_device structure to read 802.3-c45 IDs
  *
- * Returns zero on success, %-EIO on bus access error, or %-ENODEV if
- * the "devices in package" is invalid.
+ * Returns zero on success, %-ENODEV if the "devices in package" is invalid or
+ * no MMD responds (this includes a bus read failing with -EIO or -ENODEV while
+ * looking for a device), or a negative error code from a failed bus access
+ * otherwise (usually %-EIO).
  */
 int phy_get_c45_ids(struct phy_device *phydev)
 {
-- 
2.34.1

