Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795713693;
	b=drpCq3EMMZI6/j+DrfMu/Zxzr7S2ygbCaM4oZlEEC49st1CtDhZ9tXMbmvXIrIkq8JWN
	 uyjZ9cwJU7Dp11arLxpwLfBBGvGXfzUTTj/ncNKcFAqKmxxjTujgC+urtiF9aOQo0zyht
	 pB6ebn8sQQ5ryWvbdbGlWGwMBabTK9lhHuX9ctU6oNHjDD8jxHw0MXvh8Ly4TXhoroIbd
	 RHUCZjvpZ1qxlogJeNGY2408JFfYrEzELRGYIk2O+2kDE2YzdIdKYaE7njpG3zt0NLYXp
	 GA2rsJGm12R0Jgh9J0c0OsoYHxQmaugsfH/XOPR7SupjQsMFXBuvdC+re1sLKPLDNRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795713693;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=PfNgmba12Q/4pv9fP06XSiAZ4Zk40dNRsJAuWaJ8SFA=;
	b=GCQkVY4Rm/1vBbfp0p+IPdh88TYZODzONhCpRivJFVf28cyBqvxvZ4KYC2o9oqz8Qvnq
	 0Q/fW2ABKWupfa8QS7+tzXly6QfGwNMmckf++85pux7ysydvqTm7GU4LiZACU6+QmeV6/
	 uK5pcPGfj1xEVhdPW+UmzNuVJopOQNPdmUbD963ViZI/ZvE0v2nPaH/NItQjHLM2xa06T
	 lEk/632lNn4tXrjTFeH2kdMGCP4nX0SFmVUVE86Bf1e0ZQUfSSGzgeUdK4SlbWT1DtL1q
	 9O0Y4z2LpE763coi1Wvz73KdCxDxy3eL44wXhAAF8NL/RGhvOccxZ6ebKg8TJwvlpGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=beagleboard.org;
	spf=fail smtp.mailfrom=beagleboard.org;
	dkim=pass header.d=beagleboard.org header.i=@beagleboard.org header.a=rsa-sha256 header.s=google header.b=wcB8W5fZ;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BAC6606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 17:21:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0BAC6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard.org header.i=@beagleboard.org header.a=rsa-sha256 header.s=google header.b=wcB8W5fZ
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-386ab9ab619so9616419eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:21:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard.org; s=google; t=1795713692; x=1796318492; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PfNgmba12Q/4pv9fP06XSiAZ4Zk40dNRsJAuWaJ8SFA=;
        b=wcB8W5fZh6T3k2/n48GExZpr5pB7DVEBeaEd2ISK/4wiE9NE+X3cK8FCDSONTVhXj+
         0H+ArWL8eYn2T7N7tAkY/IAcYWF+Jsqth5ipgMh9R9W12tzt//0PjCQa1Ss6kx374HLj
         6yeSLY4ET8r+TaLiWov1uUWUreFT9eaJK27ySIynDmXDISE1LjEDe5zpEdmDjJEZGouz
         GHp+6X9SdD9WPdPe5qiOn5mmCsjPJcDcGwRsvwbMmCLyG5HSyxMbJ0ln/ExrZqjZpZKo
         AhygYIh0eAfShJf04GsGxgVH16twHS22SA5vcp0MHrK8hfdrOPFYencUb75xNeGH/JC/
         GAUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795713692; x=1796318492;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=PfNgmba12Q/4pv9fP06XSiAZ4Zk40dNRsJAuWaJ8SFA=;
        b=ndDXvDPp2szqkVT3YrgPgBAIBBfOaMMZZK1/NUP64gIMbGdezXdgE5wJEDtlI8zX1f
         qsr9em1OXACDK5VsluQS5pPEESsE1hKOiI9eSZ9GZv0EHqNHeboHAUgq5bx30HdQ3oEu
         cxyMSa0km/bQUkezp1oVoBv2Pl+9LjrtZDVMnrycnCxfhekeAOhnL8rq5x8xnXqbpZAB
         1Cy7LsJQRBUvCex2GDLbvOlU0g6TlMgZHJRkSATd+bLERxed130o9cTSBPWhEtdS3QFn
         bOYnIhOUZgYzWXbEb/zBrf8fqt4EoACVT5x5PhRLg2ORKXnEigzBEvCygrs8kXLhCL6h
         MojQ==
X-Forwarded-Encrypted: i=1; AL+hErGQQoHPOs1IRsWyjc8RqRldRM7ioIcVjg/OL5lzBC4xr8fqky5RuKGtP7i2krVX4Lxz0xu76mlR8dSrs/w=@vger.kernel.org
X-Gm-Message-State: APuU4Z9d0WhEG4VEhJFC3bPngyt0+a+C9G7J4DkWWSapSoZBilDEFat5
	FM7c6tGIQOeWBwDE5syGabPSx+e1KO+lZtUGrQ+vKMDkVVtNLFCc4/twuqnRAG1BfLDa075+nLe
	EE3o=
X-Gm-Gg: AZFdTZduG/c6XpRxhtCRqi7GRxvXS1IGf9bpcjwG8osaTlQB6sSyfCIxQvqZBoioHjY
	mg/CdGHqfkI60BzZ9xgW+/Y8tqeoRb3yjkAfq0gkmrShXQ199n97lLPRJe54Gy+CQZW5Yoreaau
	2NWhTLOzMEm3mjZDlsOv7rUnp5UKD+VMecKiILgfc+A7sk+D5F59wBd1xqojycGa7foyg0RDST6
	4y93xhBUcCX85Jaj25TNGTWz9U373Sq+34hRM7pf3Xj1NEC4Sva52e4546kiX1KHIWVHraCCvsZ
	Ef9uuvGvdwUg4pF1VkbQEJXDRitEfN8P4VNnSxzbNcusAlfhFinTS7azhqWbfAeuoDfWFMES0G7
	QkHOB6k5F+p0JLWuWpo/9DlzHoYbB8wlWnN2qmyWNXwELbn+cAs7dQSe5hYGpLfskpYV5MJpAvq
	4wNrXgLLsNMcDf7/cO2zxCRMtPi/fLNI/VFcQ9iUzXNsh7Xs9WXMqsvsSnO+MJu/lfiTF/nStEG
	Y00SgnrzXTsv8wIMzbM5kAcgiNPnMkuJtBVnpwPK5Gfm6ZCZq6o0yreabDcezPwScukC91C3hKI
	47r2NhHPjEH3xOB+x/X4PsFggQAzv/i4MYQIA/9lj5VnyMfyGySZQEw5uNKx
X-Received: by 2002:a05:7300:de44:b0:375:c5e1:931d with SMTP id 5a478bee46e88-3857073ebabmr21809220eec.25.1795713691974;
        Thu, 26 Nov 2026 09:21:31 -0800 (PST)
Received: from [192.168.29.131] ([2405:201:4019:32fc:2fd:478e:999:d6fd])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd46c5sm80638997eec.11.2026.11.26.09.21.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 09:21:31 -0800 (PST)
From: Ayush Singh <ayush@beagleboard.org>
Date: Thu, 26 Nov 2026 22:51:07 +0530
Subject: [PATCH v2] ACPI: power: Evaluate power resource _ON methods
 exclusively
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
Message-Id: <20261126-ssd-fix-v2-1-32c91f6532e3@beagleboard.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/z3MQQrDIBAAwK/InrVkTTA1p/yj5KB1NQslFi0hJ
 eTvpYH2OofZoVJhqjCIHQqtXDkvMAgtBdxntyRSHGAQoBttELVWtQYVeVPG986b1vbWBJACnoU
 ib+d0m6SAmesrl/cZr/jV39H9jxUVKqIrxa5F23gcPbn0IJ9dCZdcEkzHcXwAO4aVYqQAAAA=
X-Change-ID: 20261122-ssd-fix-6b7ab639796d
To: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>
Cc: linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ayush Singh <ayush@beagleboard.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3604; i=ayush@beagleboard.org;
 h=from:subject:message-id; bh=scaIQdSo8yK8WKKmDlfqg0jPD/+11cdjBi/EMSzB2xU=;
 b=owEBbQKS/ZANAwAKAQXO9ceJ5Vp0AcsmYgBrCGqXr8hp6mXq9jzn93WuYsVUslIF2ulCNBiiO
 Fy68sxpChGJAjMEAAEKAB0WIQTfzBMe8k8tZW+lBNYFzvXHieVadAUCawhqlwAKCRAFzvXHieVa
 dM5uD/9WdG28F+lk2AN/P7FPzNVAlw1m/ZP2Zj1N72s2yAiLbd95/UjhTp6pgYkmF8xYZccXp/I
 njFMb39qzAagJgMko3uHsB6JH89HsDsU5F9d/It5GOeOSEG/aEPE7TqiZYG/F/Uz8MYwPhKWB+Q
 +QcXb6DZIvgjR/Udlv65PPrOmohENlHwGqzv7fX0E7YnDRMjrtHbJS1TEQwBvIJ1BOeuaea7XTs
 QazDG9epd1WUCSRuMJbNqinzdG53vOaPZE5GBLBBhhAABXC7ONoEQTlY+TgaXDb3g8lnyTnLBW9
 upJx4BCU09An7nIAQVBl9bcV8Ng1Ae8QMaCwhpg3JZFBoGBt1/xNMSa5jhK3gwBJyYVzmdInJMn
 FDxQQngMhjTmFc6jdVorfNDtfpI3HcQptiOtAeyx5obZOOfNdWTAHfrZ1M5KZUo+Ixvb5t9iISN
 4TnbhR5rBTT4CSb2YYdkKVysfUM7m4U5T9898JcilapqEmYo8c6A15+yEr1wRXAYhP6anyUPWKP
 VRl5tRkqEgwFoBGaf9wV6QxoGZT+zdIeucVsHKxujM5QRAPDDd3+nRlkYQdf5WwfigxL6pFakyQ
 VrWZjfao6nSKrX9Cb1Yxa6YyhMKAC+efJs9xUHDSG2Atm3MCebhqSiSpCaXq++8cRqR1ouFfBhK
 urX5cDKh9iHEqNw==
X-Developer-Key: i=ayush@beagleboard.org; a=openpgp;
 fpr=DFCC131EF24F2D656FA504D605CEF5C789E55A74

On the Lenovo Yoga Pro 7 14AKP10 (83KG, AMD Krackan), the NVMe drive in
the second M.2 slot is frequently lost after resuming from s2idle:

  pcieport 0000:00:02.1: broken device, retraining non-functional downstream link at 2.5GT/s
  pcieport 0000:00:02.1: retraining failed
  pcieport 0000:00:02.1: Data Link Layer Link Active not set in 100 msec
  nvme nvme1: Disabling device after reset failure: -19

The _ON methods of the two M.2 slots' power resources update a clock
control register shared by both slots without any locking, and sleep in
the middle of the update. Since the root ports are resumed
asynchronously, the two methods can run concurrently, and one of them
can undo the other's change, leaving that slot's reference clock
disabled. Its link then never trains.

The same symptom has been reported on the closely related IdeaPad Pro 5
14AKP10 (83JL) [0], which likely has the same problem and should be
fixed by this as well.

Evaluate power resource _ON methods one at a time using the
acpi_evaluate_object_exclusive() helper. With this, 20/20
s2idle cycles succeeded, versus failure within 1-2 cycles before.
Also tested in normal laptop usage for a few days.

[0]: https://ratatoskr.run/linux-pci/2026/04/6586201/t

Suggested-by: Rafael J. Wysocki <rafael@kernel.org>
Assisted-by: claude-opus-5-5
Signed-off-by: Ayush Singh <ayush@beagleboard.org>
---
On the Lenovo Yoga Pro 7 14AKP10 (83KG, AMD Krackan, BIOS QFCN29WW),
the NVMe drive behind root port 00:02.1 (ACPI GPP3) is lost on nearly
every s2idle resume, while the drive in the other M.2 slot (GP10) always
comes back. Updating to the latest BIOS did not help, and neither did
disabling SSD power management via kernel parameters or recovering the
device from userspace.

The "broken device, retraining non-functional downstream link at
2.5GT/s" / "retraining failed" messages come from the Target Speed quirk
reacting to a link that cannot train at all. The actual cause is a race
between the two slots' power resource _ON methods in firmware, which
can leave one slot's reference clock disabled, as described in the
patch. I can share the relevant AML and debug logs if useful.

Testing: 20/20 s2idle cycles with real S0i3 residency, versus failure
within 1-2 cycles without the patch. I have also done normal daily use
testing outside of synthetic suspend.

The IdeaPad Pro 5 14AKP10 (83JL) appears to have the same problem on
the same root port [0].

As suggested, we now use acpi_evaluate_object_exclusive
unconditionally.

[0]: https://ratatoskr.run/linux-pci/2026/04/6586201/t
---
Changes in v2:
- Switch to using acpi_evaluate_object_exclusive() unconditionally
- Link to v1: https://lore.kernel.org/r/20261124-ssd-fix-v1-1-ee8ef43190b1@beagleboard.org
---
 drivers/acpi/power.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/acpi/power.c b/drivers/acpi/power.c
index 23a4e207a01e..82c8af6f8c7a 100644
--- a/drivers/acpi/power.c
+++ b/drivers/acpi/power.c
@@ -368,7 +368,7 @@ static int __acpi_power_on(struct acpi_power_resource *resource)
 	struct acpi_power_dependent_device *dep;
 	acpi_status status = AE_OK;
 
-	status = acpi_evaluate_object(handle, "_ON", NULL, NULL);
+	status = acpi_evaluate_object_exclusive(handle, "_ON", NULL, NULL);
 	if (ACPI_FAILURE(status)) {
 		resource->state = ACPI_POWER_RESOURCE_STATE_UNKNOWN;
 		return -ENODEV;

---
base-commit: 988117cc1bb17338c586a4e21ade88b5397eac33
change-id: 20261122-ssd-fix-6b7ab639796d

Best regards,
-- 
Ayush Singh <ayush@beagleboard.org>

