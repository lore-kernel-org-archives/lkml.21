Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795298328;
	b=IdpuQ61+e8X69Sk+cHH4xX4dg+VR3uow9iZTdVQNV3V1m8kLZMGbBCVT82hrtkTgeGPi
	 GkOCHJBSH0tiTcrOBfVOIIApIZgY8uCbcLbccPS9W0btujDImKNa1KKFQrJqWkbvB/0Og
	 c88QGHy22unB08OWsITk6bMw1HojcqEWSHf4yj9VrGyQU5DrAOZ++4BfvxlGRZvYCvwrH
	 ZWdiRa3ubhgNlgsNiNTon6BFoeMDdyXPAyDbjR6DJby/2GgQ5MksRmAHbNlm1UiTFM0RW
	 rmS7q1VeO24w7ZoAyDDb2BBg4Cx78jOsuu4dW2E3ay5WPRdgRFaobqGTI0qJHvKyOug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795298328;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=46VDdhvfENPzlaXJtPGRjqKkSBNfoMZg5S+SSN5ITC4=;
	b=HkJJme34Q4x5cgjy0HwOwtEJmbK1nfxpYG0f7MdHazQjMWHq2+7NbKcXYvebZp2UaIV6
	 ayRZL3B0zkjJl2zwVBdx/SDe42g0zs+liFTaZ2u9iEHqRapcrWlrM+Z00y9FynmAjI0Bc
	 B9RIZ6kIaTDWfBcZFWy7RQCD7u+eq21RRqWvqJn4kqpO3VAA0hPOVTtAbygoAkQaMNiND
	 CubCrWJiTsgwwMIA66IZIJstKW0qfJJvBFe2TPCumnA3/5Z8+mJEtDIPCLctsI3b1p/AB
	 Rx+v2GVlMBr/wm6VIYuIgRxWSveLY7jijmI0Fgz2z+QFPgxy3cGNaSbS3qfi5USaF0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bJoyM5hI;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 739B8606A320
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 21:58:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 739B8606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bJoyM5hI
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-3866a784546so2354041eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 13:58:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795298327; x=1795903127; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=46VDdhvfENPzlaXJtPGRjqKkSBNfoMZg5S+SSN5ITC4=;
        b=bJoyM5hIwxNrj1Qx6L6ywM19qg3W9QDVQjNGn1u9sUw0J35VmcgG3TY1Dfgkz+GB3k
         8+ldL+il//9AvFrc9Hkzd/I3hIIQE0HfcKYcZe0I1cqge2D5qz33UW2MyPTpi13m5pZD
         06Wz033gRZ4gdt/2D18hFUBx4cZTJqw38jDmAyHuQYuG2pad/mt765kNoT/4W/YK/aHY
         fRaEkWh+jh806hu1PxZH04s6H6Or3CWfoQ5sXTVwXGJncXtwqeRgfpz9ls4r5IS70KgL
         BFU88ppAaT/NgZqVJI4+WM7qNVp/2JpJTfJ/AXkZDNvX6ZIGfA2v1USFXYy3Ao292wXc
         NJqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795298327; x=1795903127;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=46VDdhvfENPzlaXJtPGRjqKkSBNfoMZg5S+SSN5ITC4=;
        b=YhF6Nicv+x7+KClWU3xj5/2GTsPVtEEcvLiHESDpW9K5ailTbDSaJJSV73YQn3mxz/
         kp4oAc7wFWpC5GDo+0C42DxYfDiJkS0PHaXKx7N09Gb0CVYwYaWswqAWURNHyNKdkKsY
         2J8EMmXZwky1Wcc8M7k6D27RMDInXkByonSDY9U6XMSEUaZyCmNvrNzQsqZnyv+VSbnS
         nADDo2mbQ3GxuNOK8MW9S/NwDEuBAXGIqGhU1nKNDDVEpkfAvN9JxiaGMJBAOBDT32ke
         nf67J2o9U5L1HOLP3q549uhLT9CTxKl5eJ3JAjyY3Zra8joxYxyrDt9VkVwrhHrqAXOn
         kvtg==
X-Forwarded-Encrypted: i=1; AL+hErFZBAz6hQr2TSQ7vzLMLPtjTIzYHYtdF8aMlBnXTV2bWxI8V4OBQtMgQnmloYFxAEOb8PNery0Qh4CyJRk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8hxP9LIoWKN2FDlPiAAx1IGyAFJFnN88stBGdb9DhEWsQyv/26
	VQZGk3uRy2/5xZZ3164IXgUqaUIxjYdSFlDgAzQ+XR83R8PfCINi9c4=
X-Gm-Gg: AZFdTZdl2O1MQcZQYrpKnDmVdgwPBdK5p4WhDl2RO6rDjODUTfOZWK39TCmECLQsn5O
	t4TVZ6IseJAgIoBBLLF1pa1S4oyxwuD96zHzEMKp9saet1U57MunTeLd5vRQowegQO7tVHa2Byt
	kz3edtRVKP/18e0C7Qt69p5FOd8ZtiHm4iwCf5ARPqR30VFLUlWGqMQq8rBBauCQ9jk+J8O9Cza
	lqiE4xYQUKAK7iGrdsV132R81V0NZI+HSYLH1aSYtwbmZ5qSHdu9gA7NM2+YTYwjE/WatMtnAue
	RFCuxaENsszsryjOKmNPgIcaeALJl9gfeTbdJEIHD5+XnY6a/CtEG0nvqo0kmutlw6eikb5aUbY
	rYneLaH2x26q/+X5vD39anVaGkAvhp48jibClwxLryD+IpCxk1I940cC9P/lES7lkcugciPbpAy
	HLPm6fEa3Xfpy1d04zQW0LM4VljkeFe0hvm0TpH4I86RekjhQoh1hGPVMKaDXn4vdZklxjkQvPZ
	FkUSO/04HRBnyBahh8og/GmAocJrpazW50lOp8pZ+J2/1pqlJ+w43xU1Ku1ndxg5lvZtGXPH3T1
	YARMj++GcSvzPv/gy6WhDyK0jGD4Byns7DY8tgO//fBLZ2koebxMsZxXk09zlOQDtbwi8tPJ94i
	i/Cc9kulr
X-Received: by 2002:a05:693c:8813:10b0:385:cbc5:7eeb with SMTP id 5a478bee46e88-385cbc595acmr5922819eec.15.1795298327326;
        Sat, 21 Nov 2026 13:58:47 -0800 (PST)
Received: from at-Standard-PC-Q35-ICH9-2009.tailbdca44.ts.net ([223.228.8.4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567ea2cc5sm19646544eec.29.2026.11.21.13.58.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 13:58:46 -0800 (PST)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: 
Cc: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>,
	Antoine Sidem <sidemantoine@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	linux-acpi@vger.kernel.org (open list:ACPI),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3] ACPI: processor: Use Apple-specific methods for P/C-states
Date: Sat, 21 Nov 2026 16:58:38 -0500
Message-ID: <20261121215841.1286-1-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.55.0
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

Use APSS and ACST instead of _PSS and _CST when available on Intel Macs
as they include better P/C-States.
These methods are used in macOS (X86PlatformPlugin.kext),
and when not found we fallback to generic _PSS and _CST methods.

Changes in v3:
- Used method variable instead of using_
- Used bool instead of int for functions

Changes in v2:
- Improved description of the patch
- Replaced goto's and if statement's with new functions
- Added support to differentiate _PSS and APSS in debug info/error info
- Added support to differentiate _CST and ACST in debug info/error info
- Used Package instead of variable for ACST description

Link to v2:
https://lore.kernel.org/all/20261113131243.28214-1-atharvatiwarilinuxdev@gmail.com/

Link to v1:
https://lore.kernel.org/all/20261015204450.1270-1-atharvatiwarilinuxdev@gmail.com/

Tested-by: Antoine Sidem <sidemantoine@gmail.com>
Signed-off-by: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
---
 drivers/acpi/acpi_processor.c    | 79 +++++++++++++++++++++-----------
 drivers/acpi/processor_perflib.c | 43 +++++++++++++----
 2 files changed, 85 insertions(+), 37 deletions(-)

diff --git a/drivers/acpi/acpi_processor.c b/drivers/acpi/acpi_processor.c
index 5fbab5417..65e52cd52 100644
--- a/drivers/acpi/acpi_processor.c
+++ b/drivers/acpi/acpi_processor.c
@@ -18,6 +18,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/pci.h>
+#include <linux/platform_data/x86/apple.h>
 #include <linux/platform_device.h>
 
 #include <acpi/processor.h>
@@ -815,6 +816,22 @@ bool acpi_processor_claim_cst_control(void)
 }
 EXPORT_SYMBOL_NS_GPL(acpi_processor_claim_cst_control, "ACPI_PROCESSOR_IDLE");
 
+static bool acpi_processor_apple_acst(acpi_handle handle, struct acpi_buffer *buffer)
+{
+	acpi_status status;
+
+	if (!x86_apple_machine)
+		return false;
+
+	status = acpi_evaluate_object(handle, "ACST", NULL, buffer);
+	if (ACPI_FAILURE(status)) {
+		buffer->length = ACPI_ALLOCATE_BUFFER;
+		buffer->pointer = NULL;
+		return false;
+	}
+
+	return true;
+}
 /**
  * acpi_processor_evaluate_cst - Evaluate the processor _CST control method.
  * @handle: ACPI handle of the processor object containing the _CST.
@@ -837,28 +854,34 @@ int acpi_processor_evaluate_cst(acpi_handle handle, u32 cpu,
 	acpi_status status;
 	u64 count;
 	int last_index = 0;
-	int i, ret = 0;
+	int i, ret = 0, base = 0;
+	const char *method = "_CST";
 
-	status = acpi_evaluate_object(handle, "_CST", NULL, &buffer);
-	if (ACPI_FAILURE(status)) {
-		acpi_handle_debug(handle, "No _CST\n");
-		return -ENODEV;
+	if (acpi_processor_apple_acst(handle, &buffer)) {
+		base = 1; /* ACST is a 4 field package we need to skip the first field */
+		method = "ACST";
+	} else {
+		status = acpi_evaluate_object(handle, "_CST", NULL, &buffer);
+		if (ACPI_FAILURE(status)) {
+			acpi_handle_debug(handle, "No _CST\n");
+			return -ENODEV;
+		}
 	}
 
 	cst = buffer.pointer;
 
-	/* There must be at least 2 elements. */
-	if (!cst || cst->type != ACPI_TYPE_PACKAGE || cst->package.count < 2) {
-		acpi_handle_warn(handle, "Invalid _CST output\n");
+	/* There must be at least 2 elements for _CST and at least 3 elements for ACST. */
+	if (!cst || cst->type != ACPI_TYPE_PACKAGE || cst->package.count < base + 2) {
+		acpi_handle_warn(handle, "Invalid %s output\n", method);
 		ret = -EFAULT;
 		goto end;
 	}
 
-	count = cst->package.elements[0].integer.value;
+	count = cst->package.elements[base].integer.value;
 
 	/* Validate the number of C-states. */
-	if (count < 1 || count != cst->package.count - 1) {
-		acpi_handle_warn(handle, "Inconsistent _CST data\n");
+	if (count < 1 || count != cst->package.count - 1 - base) {
+		acpi_handle_warn(handle, "Inconsistent %s data\n", method);
 		ret = -EFAULT;
 		goto end;
 	}
@@ -882,24 +905,24 @@ int acpi_processor_evaluate_cst(acpi_handle handle, u32 cpu,
 
 		memset(&cx, 0, sizeof(cx));
 
-		element = &cst->package.elements[i];
+		element = &cst->package.elements[base + i];
 		if (element->type != ACPI_TYPE_PACKAGE) {
-			acpi_handle_info(handle, "_CST C%d type(%x) is not package, skip...\n",
-					 i, element->type);
+			acpi_handle_info(handle, "%s C%d type(%x) is not package, skip...\n",
+					 method, i, element->type);
 			continue;
 		}
 
 		if (element->package.count != 4) {
-			acpi_handle_info(handle, "_CST C%d package count(%d) is not 4, skip...\n",
-					 i, element->package.count);
+			acpi_handle_info(handle, "%s C%d package count(%d) is not 4, skip...\n",
+					 method, i, element->package.count);
 			continue;
 		}
 
 		obj = &element->package.elements[0];
 
 		if (obj->type != ACPI_TYPE_BUFFER) {
-			acpi_handle_info(handle, "_CST C%d package element[0] type(%x) is not buffer, skip...\n",
-					 i, obj->type);
+			acpi_handle_info(handle, "%s C%d package element[0] type(%x) is not buffer, skip...\n",
+					 method, i, obj->type);
 			continue;
 		}
 
@@ -907,8 +930,8 @@ int acpi_processor_evaluate_cst(acpi_handle handle, u32 cpu,
 
 		obj = &element->package.elements[1];
 		if (obj->type != ACPI_TYPE_INTEGER) {
-			acpi_handle_info(handle, "_CST C[%d] package element[1] type(%x) is not integer, skip...\n",
-					 i, obj->type);
+			acpi_handle_info(handle, "%s C[%d] package element[1] type(%x) is not integer, skip...\n",
+					 method, i, obj->type);
 			continue;
 		}
 
@@ -947,8 +970,8 @@ int acpi_processor_evaluate_cst(acpi_handle handle, u32 cpu,
 				cx.entry_method = ACPI_CSTATE_HALT;
 				snprintf(cx.desc, ACPI_CX_DESC_LEN, "ACPI HLT");
 			} else {
-				acpi_handle_info(handle, "_CST C%d declares FIXED_HARDWARE C-state but not supported in hardware, skip...\n",
-						 i);
+				acpi_handle_info(handle, "%s C%d declares FIXED_HARDWARE C-state but not supported in hardware, skip...\n",
+						 method, i);
 				continue;
 			}
 		} else if (reg->space_id == ACPI_ADR_SPACE_SYSTEM_IO) {
@@ -956,8 +979,8 @@ int acpi_processor_evaluate_cst(acpi_handle handle, u32 cpu,
 			snprintf(cx.desc, ACPI_CX_DESC_LEN, "ACPI IOPORT 0x%x",
 				 cx.address);
 		} else {
-			acpi_handle_info(handle, "_CST C%d space_id(%x) neither FIXED_HARDWARE nor SYSTEM_IO, skip...\n",
-					 i, reg->space_id);
+			acpi_handle_info(handle, "%s C%d space_id(%x) neither FIXED_HARDWARE nor SYSTEM_IO, skip...\n",
+					 method, i, reg->space_id);
 			continue;
 		}
 
@@ -966,8 +989,8 @@ int acpi_processor_evaluate_cst(acpi_handle handle, u32 cpu,
 
 		obj = &element->package.elements[2];
 		if (obj->type != ACPI_TYPE_INTEGER) {
-			acpi_handle_info(handle, "_CST C%d package element[2] type(%x) not integer, skip...\n",
-					 i, obj->type);
+			acpi_handle_info(handle, "%s C%d package element[2] type(%x) not integer, skip...\n",
+					 method, i, obj->type);
 			continue;
 		}
 
@@ -975,8 +998,8 @@ int acpi_processor_evaluate_cst(acpi_handle handle, u32 cpu,
 
 		obj = &element->package.elements[3];
 		if (obj->type != ACPI_TYPE_INTEGER) {
-			acpi_handle_info(handle, "_CST C%d package element[3] type(%x) not integer, skip...\n",
-					 i, obj->type);
+			acpi_handle_info(handle, "%s C%d package element[3] type(%x) not integer, skip...\n",
+					 method, i, obj->type);
 			continue;
 		}
 
diff --git a/drivers/acpi/processor_perflib.c b/drivers/acpi/processor_perflib.c
index 9e25d6124..0844147d9 100644
--- a/drivers/acpi/processor_perflib.c
+++ b/drivers/acpi/processor_perflib.c
@@ -17,6 +17,7 @@
 #include <linux/cpufreq.h>
 #include <linux/slab.h>
 #include <linux/acpi.h>
+#include <linux/platform_data/x86/apple.h>
 #include <acpi/processor.h>
 #ifdef CONFIG_X86
 #include <asm/cpufeature.h>
@@ -313,6 +314,23 @@ static void amd_fixup_frequency(struct acpi_processor_px *px, int i)
 	}
 }
 
+static bool acpi_evaluate_apple_apss(acpi_handle handle, struct acpi_buffer *buffer)
+{
+	acpi_status status;
+
+	if (!x86_apple_machine)
+		return false;
+
+	status = acpi_evaluate_object(handle, "APSS", NULL, buffer);
+	if (ACPI_FAILURE(status)) {
+		buffer->length = ACPI_ALLOCATE_BUFFER;
+		buffer->pointer = NULL;
+		return false;
+	}
+
+	return true;
+}
+
 static int acpi_processor_get_performance_states(struct acpi_processor *pr)
 {
 	int result = 0;
@@ -323,16 +341,21 @@ static int acpi_processor_get_performance_states(struct acpi_processor *pr)
 	union acpi_object *pss = NULL;
 	int i;
 	int last_invalid = -1;
+	const char *method = "_PSS";
 
-	status = acpi_evaluate_object(pr->handle, "_PSS", NULL, &buffer);
-	if (ACPI_FAILURE(status)) {
-		acpi_evaluation_failure_warn(pr->handle, "_PSS", status);
-		return -ENODEV;
+	if (acpi_evaluate_apple_apss(pr->handle, &buffer))
+		method = "APSS";
+	else {
+		status = acpi_evaluate_object(pr->handle, "_PSS", NULL, &buffer);
+		if (ACPI_FAILURE(status)) {
+			acpi_evaluation_failure_warn(pr->handle, "_PSS", status);
+			return -ENODEV;
+		}
 	}
 
 	pss = buffer.pointer;
 	if (!pss || pss->type != ACPI_TYPE_PACKAGE) {
-		pr_err("Invalid _PSS data\n");
+		pr_err("Invalid %s data\n", method);
 		result = -EFAULT;
 		goto end;
 	}
@@ -360,7 +383,8 @@ static int acpi_processor_get_performance_states(struct acpi_processor *pr)
 		status = acpi_extract_package(&(pss->package.elements[i]),
 					      &format, &state);
 		if (ACPI_FAILURE(status)) {
-			acpi_handle_warn(pr->handle, "Invalid _PSS data: %s\n",
+			acpi_handle_warn(pr->handle, "Invalid %s data: %s\n",
+					 method,
 					 acpi_format_exception(status));
 			result = -EFAULT;
 			kfree(pr->performance->states);
@@ -384,8 +408,8 @@ static int acpi_processor_get_performance_states(struct acpi_processor *pr)
 		if (!px->core_frequency ||
 		    (u32)(px->core_frequency * 1000) != px->core_frequency * 1000) {
 			pr_err(FW_BUG
-			       "Invalid BIOS _PSS frequency found for processor %d: 0x%llx MHz\n",
-			       pr->id, px->core_frequency);
+			       "Invalid BIOS %s frequency found for processor %d: 0x%llx MHz\n",
+			       method, pr->id, px->core_frequency);
 			if (last_invalid == -1)
 				last_invalid = i;
 		} else {
@@ -402,7 +426,8 @@ static int acpi_processor_get_performance_states(struct acpi_processor *pr)
 
 	if (last_invalid == 0) {
 		pr_err(FW_BUG
-			   "No valid BIOS _PSS frequency found for processor %d\n", pr->id);
+			   "No valid BIOS %s frequency found for processor %d\n",
+			   method, pr->id);
 		result = -EFAULT;
 		kfree(pr->performance->states);
 		pr->performance->states = NULL;
-- 
2.55.0

