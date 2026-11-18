Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795014855;
	b=DgjtIvvxIk+Vn+dGbUim/stBpoYHKRW5OyG+JzyP2OYMVz5nvZQnLjbdSJKezOLRsLJh
	 uOUZ+dU5MTRPM9cWgidJEqxbDpS7A/3O6/gg8y6f3TEqVzNoBxzuqubLN4fV22DFhYcZn
	 UUoWqBLZr5GPPUXh3NExWY/ktzmqflzlhSCHS42KG2t/GtvbPPtca+CMBiLoFimX1WtIa
	 H07qTSTncSRWezJ8QaJ91wgnda3PYUrBJaWwG0wN6C6vJ0rzbLxsh+NDTSdSNkgkoWSAX
	 xFgBQES3BK9mycZV/0tlvJFQNJdz8XkuM3baKPer60/C8MlMeExWTeSgLv6mbX7GeKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795014855;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=eA7Ba+RNhuLv4gFQ3OIw8fIm3ERdVQLD/ZDlb9KqNxw=;
	b=ovPw0yTR+qjJ0UQm+P5M0Ve1EN1CNNbBgHbbBvlxEqdCnOJU9wFAHWGOngWLYTP0GAOl
	 NFq05GVQuLMi2FLDqdTOVwUWmSGBnND1fm98hOF1wTU9Kr9VksNTPQs9Ar589e3IoYePZ
	 z8xM3qhwbjDe6Qdi8iu5q+xXwXTmjNcn2upEGGgEDIFFZBbaLj4g9MdjhYJWiuKiZcr42
	 tV4rfhKyydHL81u3qess1L+EeKx9bmwPqeEYyJiEUK7Kwj30qiA4Mp6arTSNZBuBOcADS
	 AoTUh7CWd7z2ptmfOWioI55N0+zolo06qrwXspuvCXqOO31tXpY3TJzvg8fqf0FmjPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tfZ43j1d;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE3B606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 15:14:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ADE3B606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tfZ43j1d
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2e9ae391a05so6797535ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 07:14:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795014854; x=1795619654; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eA7Ba+RNhuLv4gFQ3OIw8fIm3ERdVQLD/ZDlb9KqNxw=;
        b=tfZ43j1dTe3DDhOX5b9+E1mKA+bJ83E2MqjJwzj3Rt1lDEmy7YSYZ6I3inAILi6tpT
         Elm9+yARx79xuzDYKT5eL9WzjZXFEGZjMC5hZ1FNckHgll5mbvU3lujU0rpIZXpeKiH8
         lJAzDx7Kkcup0lSsHL2RtBn3eORk1s9H+Sg4UkbIDY1QOFz1IB/xvsG+2grnG7QCwgKP
         2SYZPj/b4wv5V7P+yqxlscnGT9mjiM/rAfIXtTczUJyoD/TnUalq1OTCMNMUCog5/0R7
         BlR3dDOVhNWD8cO555yvcCWd2lCDC/MCBxN2hJSHjwf2k4uAkxoTfYE0ePs5jdmHH8tg
         d+Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795014854; x=1795619654;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eA7Ba+RNhuLv4gFQ3OIw8fIm3ERdVQLD/ZDlb9KqNxw=;
        b=iSFlEzmjWg80dpZ8mmlQsbpD9+j+qgDUD5DtBqiVYE95za/Ax3jb3oPV6wtdCIHnED
         7BpTFF6jhhHpGhaWfKVax+iMJ1wxQugPLPo0wI4hOQ+IvWrkQIEUmx0EkLTRjn72KN/O
         /YZXjz5+d33LIpiDA8XkiiV0TTWacMISt8gyg6Sm/ljAPrbBBGAgkUZq2wTsNvrK9hGs
         7WBOvLBYnYJ276MbD8OgZGNX3sO5IEXyjQTaNV+jYUs2UoNO3dpWKpk61YaRDgAynTUd
         tLsyD3K98HoK3JPgz4IkA2IbnROM1ShujqGuhdRspA/FtWeVlNUWXYz6611bDJR+Q2fV
         TfQA==
X-Forwarded-Encrypted: i=1; AL+hErFsKt0XFUKhzGYIIW1dd355vqv46ptYLWi0+BkWzRw/MD+uqJUDwCiDLZVZcdpKcucf8zmJ750B7QzVPS0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+pvexISq/scYs9Lb6malbcyWIGa6SA+HFjZmXRiL1f7O2pSHHK
	A3oaeed9+ov9sPbry+9WU+M7HPxLroSS+MQp1fVk0lb4zrsq91a/bqXP
X-Gm-Gg: AZFdTZfYtUpqltTmqcKBzNwdt7W/Ar5uDICFnPTUfK+kiKfa5nH09vXt80v6cFhzs/5
	M9vMbzRWmCEOThqicR1iiuhN9qAkXYfEMQkm2oqmNXPe/5VCTQms0QjNM6Myrf00KnrEdViOJEt
	ow9a3sCAvTEc7cBoHjTeHCbpLddj8raFreW61HxNoeDv4GHelO00Q3R7WompWtslyZi9yyD2L/v
	VxLFkH/0J4NnnkmoupfCHA2lOW0+nE9TJWhkMl/QQiimhi6VJhWzBJOZZZfCs3/k/idNm2wg9uE
	BLdCBEbrm9cx5XFr0BkGDXp3wiKR0Uu6VSk9xsEbs5dnSCSio/d0atxa5glUFjII/kj4gWrbsd/
	iV+VF02uv14g8ALWd7I4L8XVbh8qBvmLaU0cKYlfQpfmdKkofECbTuJ1ijXYy3fWaH2vXcSjIoH
	37Fg7WMxm+v0hOok36q2sdB9n1Un5yheEYxBY1v3ze04hvYOzc1z/SvPShZIQdUQ33v37S7EtkV
	jQiyIngnWIBUetVu0iTnxpBwKUY+2ECVtszgBS8pokLPyBHUR8wXsFj6Hr6p6AMTwWZORalrY6O
	FIisIAwONVXSVp6vhMW/1vWxznO9GxEwgbYm3hPo2aSE1hzm4bmzGQ==
X-Received: by 2002:a17:903:144b:b0:2e9:5313:8f7b with SMTP id d9443c01a7336-2efd9b2ebd8mr50434585ad.9.1795014853877;
        Wed, 18 Nov 2026 07:14:13 -0800 (PST)
Received: from csl-conti-dell7858.ntu.edu.sg ([155.69.195.57])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff6236191sm15251045ad.53.2026.11.18.07.14.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 07:14:13 -0800 (PST)
From: Maoyi Xie <maoyixie.tju@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Christian Vogel <vogelchr@vogel.cx>,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2] w1: ds2490: bound the search results to the found_ids array
Date: Wed, 18 Nov 2026 23:14:08 +0800
Message-Id: <20261118151408.4001564-1-maoyixie.tju@gmail.com>
X-Mailer: git-send-email 2.34.1
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

ds9490r_search() queues the ids from the DS2490 in found_ids, which has
max_slave_count entries. max_slave_count is also the search limit. With
more devices than that on the bus, the DS2490 sends that many ids and
then a discrepancy value, as the comment in the function says.

The break at the limit leaves the loop over the current bulk read, but
the outer loop keeps reading until the device is idle. A discrepancy
value in a later bulk read is then stored in found_ids[max_slave_count],
one past the end, and the callback loop reads it back as an id. If the
device sends more values, they are written past the array too.

Store an id only if it fits and pass at most max_slave_count ids to the
callback. found can still reach max_slave_count + 1, so the check after
the loop sees that more devices remain. Use one local copy of
max_slave_count for the allocation and the bound.

I found this with a CodeQL-based checker that we are developing. A
userspace harness runs an unmodified copy of ds9490r_search() from
next-20261116 against a fake DS2490. With the default max_slave_count of
64, AddressSanitizer reports an 8-byte write past the 512-byte array. I
do not have the hardware, so the fix is only compile-tested with W=1 and
checked with the harness.

Fixes: e3fe0e89fec6 ("w1/masters/ds2490: queue up found IDs during scan")
Cc: stable@vger.kernel.org
Signed-off-by: Maoyi Xie <maoyixie.tju@gmail.com>
---
I used Claude to help check the checker's report and to write the
userspace harness and this patch. Sorry that v1 did not say so.

v2:
- rebase on linux-next (next-20261116) and test there (W=1 build, the
  same harness)

This applies to linux-next but not to the w1 branches, where the
allocation is still kmalloc_array(). I can send a version for them.

v1: https://lore.kernel.org/all/20261117145534.755665-1-maoyixie.tju@gmail.com/

 drivers/w1/masters/ds2490.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/w1/masters/ds2490.c b/drivers/w1/masters/ds2490.c
index f1d4075075a657..c5d76a5ceff468 100644
--- a/drivers/w1/masters/ds2490.c
+++ b/drivers/w1/masters/ds2490.c
@@ -697,6 +697,7 @@ static void ds9490r_search(void *data, struct w1_master *master,
 	u16 value, index;
 	struct ds_status st;
 	int search_limit;
+	int max_slaves;
 	int found = 0;
 	int i;
 
@@ -718,7 +719,8 @@ static void ds9490r_search(void *data, struct w1_master *master,
 	 * We are holding the bus mutex during the scan, but adding devices via the
 	 * callback needs the bus to be unlocked. So we queue up found ids here.
 	 */
-	found_ids = kmalloc_objs(u64, master->max_slave_count);
+	max_slaves = master->max_slave_count;
+	found_ids = kmalloc_objs(u64, max_slaves);
 	if (!found_ids) {
 		kfree(buf);
 		return;
@@ -733,7 +735,7 @@ static void ds9490r_search(void *data, struct w1_master *master,
 
 	value = COMM_SEARCH_ACCESS | COMM_IM | COMM_RST | COMM_SM | COMM_F |
 		COMM_RTS;
-	search_limit = master->max_slave_count;
+	search_limit = max_slaves;
 	if (search_limit > 255)
 		search_limit = 0;
 	index = search_type | (search_limit << 8);
@@ -760,7 +762,10 @@ static void ds9490r_search(void *data, struct w1_master *master,
 			if (err < 0)
 				break;
 			for (i = 0; i < err/8; ++i) {
-				found_ids[found++] = buf[i];
+				if (found < max_slaves)
+					found_ids[found] = buf[i];
+				if (found <= max_slaves)
+					found++;
 				/*
 				 * can't know if there will be a discrepancy
 				 * value after until the next id
@@ -798,6 +803,7 @@ static void ds9490r_search(void *data, struct w1_master *master,
 	mutex_unlock(&master->bus_mutex);
 	kfree(buf);
 
+	found = min(found, max_slaves);
 	for (i = 0; i < found; i++) /* run callback for all queued up IDs */
 		callback(master, found_ids[i]);
 	kfree(found_ids);

base-commit: 749a4de370409464cf8501ec5b2451df45c84eb4
-- 
2.34.1

