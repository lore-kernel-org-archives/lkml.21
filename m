Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795478348;
	b=EZ+4YTt/hcyHAY1J9MdFhK8fXhNn/MwESZwd6rTGL2rMwpfjyP3z8S83MWIVBKO1CDTy
	 N31+YJVOrap7XP9h3scNroEgFFvuWIkRQvpbWHlJ2/w6wsdIrwTatMUjhj+gpDfGDNVej
	 1mYkS+V+83qURnmdOIXhZuXPaCHNwShrD26qdBufZDgAFIRdRpauTJ91XID3pZN53lmrp
	 P8+KLOBN9WCqWwcqAhJz5FZ9wfdNa8sPksm5YAQWakSgv7XYsrFVVPEpJ3vuLyHYfKc7G
	 ZkKGjXOTYrpNKfgfBeJ5R3PJQae0YuAeuUs+UGQPMGx1GxzDSEFYrHziF94ea+gX7aQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795478348;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7b/nDdeo9OwJ/1BWB36V3ny12dy1Q2mSpSFSLOSLpW0=;
	b=XgxqBb2JFi9Utd7/InP6PtciR2wjH+Qn6EuCBtet65UqtlfSZUj1l2PMoDgz2yGww10W
	 lwLLudIrtQgBJ5MUNTnOm7FHEZDj1Ony17Y0/j+Bwikmy9IpsWlWXtIkfEv4jQbxElVO1
	 KPg36n2NcXZPyNC+b1XnLDLxvC7w1oJRRAbf7Qz8l8vhPm6kcZrcvkUgNMEVh0eZFLN7l
	 iEM3QjAnb2zv5pg2kJGMHYgkOQ5n0jCfVGdBv1wSGKMDX5SG51Zikq5fk4wo8q3nGyjnu
	 a9gSszuXt2hg2Y88LlZzJwZxQwCKAtuR3JSksr2W64cLaMHw3BP1mf/QKQ0qdfy1miQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ZON0xTWL;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D0AE606A322
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 23:59:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D0AE606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ZON0xTWL
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso37519295e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:59:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795478346; x=1796083146; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7b/nDdeo9OwJ/1BWB36V3ny12dy1Q2mSpSFSLOSLpW0=;
        b=ZON0xTWLk3IMYJrca10pfovxXM0iWKflq555uqbDInVwekW26ykkAbQNj+OSeZnURI
         /CFZSmxIlyHAhDAI5IJDwxRCG10B5kLMDhOVXPmEhOcu3FsX8vv3g6ge4+eVpGVDrx1n
         jiOohaGRUB00c4q8cmxAX1bICo18wEg6Ijm0s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795478346; x=1796083146;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7b/nDdeo9OwJ/1BWB36V3ny12dy1Q2mSpSFSLOSLpW0=;
        b=t9KLp7LdwviLGrGybeIiuKFgENmzMy34siE2rIniOKEO7Axq3/wCx/RWF/wCC1s9mC
         J4hqogwKO7A5WiycW6qVQqhfFXkqnKgWIdmG9/WEeMQ0wuKA0JztwHWmGTLOGMvfakwq
         LAmftMyy1r3Xdh6Fs1z3rJ2oy/M2CLQ/TXGyK+Xf1BAdTOnpoqS63zih8yOWxC8MNHe7
         Hd1QBDUyIF3Q2W6GbDx5aDjvlGZ0vcN3jV1YcoU3pbbVCKl7Tozr0VWvjnuDm1QW24et
         PSiZtVxgVY6lSO1LUgrRZGgN4GWdxPYMTazP8Uwb4kDWXjQHquJdMqGXJI1fWPaB+w0E
         3nOA==
X-Forwarded-Encrypted: i=1; AL+hErE9LbubBbNwVlIa8EtAHix5GBhrxfKAOy9txxi5JeDYfLFB4URsksp0B+YTiaeGUN2wn9puLy8l0llxlBw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9VKY8IczjkI18Rhtb/HNFgAoEjTuWJwuQQPjecKXzYEt/HrKZN
	eEGwVqzv5upssEHTSYcR7NztxIj/5qJrB7vpkr9+A2ox3o9Oc9gvSbnbvuTU4I9esg==
X-Gm-Gg: AZFdTZc8zKPypx4Tt2Upi9yg1EzPMlPQ3m5G4aompMdU5I7uVwWJ367lcOeuj9TDgpX
	dzPfnVlc0BULM2n7LcJyyf/ZYABEYFlq5AOe6zjtNQ6OyZBDv21VQ0TikpafyV6+TXcel3D1vWY
	QLbhP5N9AB8AK+MOs4RYvwBfZfzEzbQK6tyRCVBvqGU5ZWsmblUNRsC9UnQZIA6oyMPYnmioZkI
	XhGwBp1z0XOAwV+dp1XrfHvuHKemmoR6m6zkYrNyAgs9Y7BAbPTHjIPfKd9cQK8RNWKM3auOLnP
	kQSyDtaVeQ/0xaubkqCBbs3yhnKi1ke4bAj2ykcdOJy2vMrW6DqaCpGBw+67CckmbmHYEJsG+z3
	0dReNQSXKGm16ZVE2UYWHCH0qQFYYA+oetx2K/X6sq6sqMYPNppsftAzePvxxVwA0uht/+Yz+eO
	WqE1ceyHYWwPesdKmB9uh/lulAssEu89VpjTvlvTJgc8frFwxmrI5sb39ltpiW6bPB8GXxYloJI
	b6L1dkumiyjdyJQ7+1VjI5IRjBdNJv7GNhidP4KtriW/PGRrhWcjvXsqXUU5pMXbRsyyH8V6WgV
	RPGDIt2wDa9KY5nMsUvpnwYsnfsjL0tXQLy9O9TGqcjWJgDULf9SrMOebbct/+lilOmhWo2Pfm0
	GQPuPuZ80BrsM8C56Ng==
X-Received: by 2002:a05:600c:1d86:b0:4a1:fa27:df7c with SMTP id 5b1f17b1804b1-4bb88922972mr271555435e9.34.1795478346401;
        Mon, 23 Nov 2026 15:59:06 -0800 (PST)
Received: from dmaluka.c.googlers.com.com (120.142.205.35.bc.googleusercontent.com. [35.205.142.120])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c61e53asm25727068f8f.59.2026.11.23.15.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 15:59:04 -0800 (PST)
From: Dmytro Maluka <dmaluka@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Lu Baolu <baolu.lu@linux.intel.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Dmitry Torokhov <dtor@google.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Bjorn Helgaas <helgaas@kernel.org>,
	iommu@lists.linux.dev,
	Jean-Philippe Brucker <jpb@kernel.org>,
	Joerg Roedel <joro@8bytes.org>,
	Joshua Peraza <jperaza@google.com>,
	Jesse Barnes <jsbarnes@google.com>,
	Len Brown <lenb@kernel.org>,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	"Oliver O'Halloran" <oohall@gmail.com>,
	Pavel Machek <pavel@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Rajat Jain <rajatja@google.com>,
	Rajat Jain <rajatxjain@gmail.com>,
	Will Deacon <will@kernel.org>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Vineeth Pillai <vineeth@bitbyteword.org>,
	Aashish Sharma <aashish@aashishsharma.net>,
	Grzegorz Jaszczyk <jaszczyk@chromium.org>,
	Tomasz Nowicki <tnowicki@google.com>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Dmytro Maluka <dmaluka@chromium.org>
Subject: [PATCH v11 1/2] PCI/ACPI: Support Microsoft's "DmaProperty"
Date: Mon, 23 Nov 2026 23:58:28 +0000
Message-ID: <20261123235845.564027-2-dmaluka@chromium.org>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
In-Reply-To: <20261123235845.564027-1-dmaluka@chromium.org>
References: <20261123235845.564027-1-dmaluka@chromium.org>
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

From: Rajat Jain <rajatja@google.com>

The "DmaProperty" is supported and currently documented and used by
Microsoft [link 1 below], to flag internal PCIe root ports that need
DMA protection [link 2 below]. We have discussed with them and reached
a common understanding that they shall change their MSDN documentation
to say that the same property can be used to protect any PCI device,
and not just internal PCIe root ports (since there is no point
introducing yet another property for arbitrary PCI devices). This helps
with security from internal devices that offer an attack surface for
DMA attacks (e.g. internal network devices).

Support DmaProperty to mark DMA from a PCI device as untrusted.

Link: [1] https://docs.microsoft.com/en-us/windows-hardware/drivers/pci/dsd-for-pcie-root-ports#identifying-internal-pcie-ports-accessible-to-users-and-requiring-dma-protection
Link: [2] https://docs.microsoft.com/en-us/windows/security/information-protection/kernel-dma-protection-for-thunderbolt
Signed-off-by: Rajat Jain <rajatja@google.com>
Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Signed-off-by: Joshua Peraza <jperaza@google.com>
Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Dmytro Maluka <dmaluka@chromium.org>
---
 drivers/acpi/property.c |  3 +++
 drivers/pci/pci-acpi.c  | 22 ++++++++++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/drivers/acpi/property.c b/drivers/acpi/property.c
index 8ee5a1f0eb48..77f97e5fa20b 100644
--- a/drivers/acpi/property.c
+++ b/drivers/acpi/property.c
@@ -56,6 +56,9 @@ static const guid_t prp_guids[] = {
 	/* Storage device needs D3 GUID: 5025030f-842f-4ab4-a561-99a5189762d0 */
 	GUID_INIT(0x5025030f, 0x842f, 0x4ab4,
 		  0xa5, 0x61, 0x99, 0xa5, 0x18, 0x97, 0x62, 0xd0),
+	/* DmaProperty for PCI devices GUID: 70d24161-6dd5-4c9e-8070-705531292865 */
+	GUID_INIT(0x70d24161, 0x6dd5, 0x4c9e,
+		  0x80, 0x70, 0x70, 0x55, 0x31, 0x29, 0x28, 0x65),
 };
 
 /* ACPI _DSD data subnodes GUID [1]: dbb8e3e6-5886-4ba6-8795-1319f52a966b */
diff --git a/drivers/pci/pci-acpi.c b/drivers/pci/pci-acpi.c
index 1150f2fbabf4..5971ffc2a375 100644
--- a/drivers/pci/pci-acpi.c
+++ b/drivers/pci/pci-acpi.c
@@ -1427,12 +1427,34 @@ static void pci_acpi_set_external_facing(struct pci_dev *dev)
 		dev->external_facing = 1;
 }
 
+static int pci_dev_has_dma_property(struct pci_dev *dev)
+{
+	struct acpi_device *adev;
+	const union acpi_object *obj;
+
+	adev = ACPI_COMPANION(&dev->dev);
+	if (!adev)
+		return 0;
+
+	/*
+	 * Property used by Microsoft Windows to enforce IOMMU DMA
+	 * protection from any device, that the system may not fully trust;
+	 * we'll honour it the same way.
+	 */
+	if (!acpi_dev_get_property(adev, "DmaProperty", ACPI_TYPE_INTEGER,
+				   &obj) && obj->integer.value == 1)
+		return 1;
+
+	return 0;
+}
+
 void pci_acpi_setup(struct device *dev, struct acpi_device *adev)
 {
 	struct pci_dev *pci_dev = to_pci_dev(dev);
 
 	pci_acpi_optimize_delay(pci_dev, adev->handle);
 	pci_acpi_set_external_facing(pci_dev);
+	pci_dev->untrusted |= pci_dev_has_dma_property(pci_dev);
 	pci_acpi_add_edr_notifier(pci_dev);
 
 	pci_acpi_add_pm_notifier(adev, pci_dev);
-- 
2.56.1.831.g720f3f5937-goog

