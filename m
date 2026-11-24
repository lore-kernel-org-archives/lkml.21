Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.139.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795554275;
	b=psvHi6K9yiIDPWO4IQYNPp9We6rrIO7ZsAMW2e8y5HMb5k5m0etpwmdgmSefwvCckVac
	 xK7EyPpXml/v8/2NxPJ81j6FE3c71SYyIcOcaIZShUZP02TZ1P3wGGB2BMVT8sCGvfttB
	 OMgb427crEMVpa7hI4rmRdRQWiGV7WD6UAzonlVLPtTnoSUaVi370OuJYCGTQDf8uhB/X
	 2BEk+P007Rdv+fHZwNrNBcdTHR6nddZ2g/r9P5HxawQ+1oqRtWfJs0A/BY/zufKB8sGN2
	 qzRy8PmMyp7K+RRbsP5w4AYBbCkzmrsoMj+H7td5ArZfQFqGrqRpscIY6tD6OPfTwWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795554275;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=HEE4z1qXFnBWTDdjAETCwV2Mt7o77ms8dAQPaznXq1g=;
	b=1lGSuRfVRL4qWOPlsTRuqZI6/puZszUqgJHmTHy07gbR2fB6SlnJisonKjKZqofzUjjC
	 fVASNRnoey7RoPZNkeWA8tgHe68HL6Ex+DTGhw2s4B/O6oW2JRFAUlwp9zGqXx0Dr3IAg
	 0orfu4lOzFo/EBRmu3Cqiy/hzvVzEITbhFmdMjmBwyS234V7WjnGTeQRwhwG6El2SZTbu
	 X6Nmnvou0RCTaF7sBmk1yl1fNpztkfQEQlvhrPsAhP/fhIPm5gfjpuN5sodH5pDNR4j73
	 ryMdpRjW9Wa5+68ZQDer6mXEjRe2nJbUU8ZdSdqnAGmpM4mpBC+ykwKn/Ux8s0zg9tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=YRjpw25i;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=RYSVYdZZ;
	arc=none smtp.remote-ip=148.163.139.74
Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B30606A685
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 21:04:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7B30606A685
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=YRjpw25i;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=RYSVYdZZ
Received: from pps.filterd (m0167075.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOKaM432982238
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 16:04:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=HEE4
	z1qXFnBWTDdjAETCwV2Mt7o77ms8dAQPaznXq1g=; b=YRjpw25ioZigVnw31awX
	iP8yzfcTyQZEOlPqDOQ0SsuOKu2MBboMFWr//cTpSWpGTHY9iuev0Up0yMu43G1b
	YsF9Ps8bfoMs+2AEu6TB4m7NqCGFEZYtIYz2/UHcVA4RDpdL5Yq0WbzyZsQ6jw/B
	KJ9ZNHivTC5hm3libb2AebYCeGxbK5N0q3GDgGtpyrcnKB2W2ctJEDQW4MoWVANO
	bV+e1LVqsXzFyOVEJ+Ri5uEf81IP7Ja2tdpyFVHMpSdZeyIBnIS51WeX6wKRTf2z
	NHo7gJgs4e+nnEEm4k4HMmJgOzR6PhJsTzDfLBt4Um0baT4MtGNl148B/LJEE6+V
	GA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4j5fanhqfe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 16:04:33 -0500 (EST)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-92106c98714so103137576d6.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 13:04:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1795554273; x=1796159073; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HEE4z1qXFnBWTDdjAETCwV2Mt7o77ms8dAQPaznXq1g=;
        b=RYSVYdZZXrvsesJneFVZ7u+svTH53OkKav4CbCThAJRVog3eYAdy860NXJalN72It3
         YpNChhBHOpgAWYyKFmo+EK9yGkTbgiUFgKDjlqs6+93UeldxdT16xrI/E/KTZy4q/ONo
         hAxsPX9d6R4kO+pfX9h2zVkp7TGNm5W4x7wibkzqf6a4IlYTacsfYVnoBUN30p5tiy4V
         K8ktycjxv3VzMJdg36eRy93oSDxHCn5P+Lr95Y5ZuOjhgd7ZM0pQwbV9Ss6GRJxpva+y
         93oVDoS6Sy8KBCR3QgP8NRoQzS/WnJtownuFXvveaFPPV0oQBo9IZyApE2nBYT84pp9W
         ngag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795554273; x=1796159073;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HEE4z1qXFnBWTDdjAETCwV2Mt7o77ms8dAQPaznXq1g=;
        b=ZWnEZO3gnEfIpcUNuvjVxLrHRH+ENXGmEgz60Q+ZuT+J4y0OXEneGCyY6VM+YVNQ0r
         jMrqx1+5/0qFtUEb5634JquN7BgVEAJfbWFUnHtLCklTtgol8qO/LZ+ST2ZUCBt2ug92
         hgD8ixAxkV7BTzf6Lj24X4FXb9bBulUGklsNDzbK/r7DekBftFPV4sVC/jX8Hq+1HQJC
         +jZvRnXHSoZ57iG9WA42SiJJ422qr/ksdZL5hHdw8PtEayAf4JcJB0k8rz0Kad9ZLMT6
         o2ZNvkwc/S0m1xm9h7JE+k11fMJ3GDmEqHbM55dP8gRwrY0fByQg/OLl5AyTjAti5BFu
         711w==
X-Forwarded-Encrypted: i=1; AL+hErHHNs9GQHiNXXD9ZEyNHet/gNLdGLgSBW+5zegI6vIqoYBWr35oncEWJ5W6bO4mLUe607b8MdM7y4pfE8U=@vger.kernel.org
X-Gm-Message-State: APuU4Z8xHbdwHhoxfYqEEK5FPUbCTPT4fawaWu+81ntW0dQyzoVyGQ8+
	KFXAd+qDkpq2TdfZ8Cb1gj3UADZod60xgAiB33aRSIg4oUQpR9/kCaf2IsoPDd1iZwgodlB7heM
	b/NycWxD6WtYE33SrKDfWf1jkAkTRxZgF/yp7amdGWdxTJHDJ35+HgxYhK9XJAQ==
X-Gm-Gg: AZFdTZcvtknOATuALzpMO22M4mZ/4WqEQTJaErzr2gZvq5u+xZryXzg349QgUqqSF9b
	UPBILDuJDPcLuk62LacTbznE9Tp8qL65v7TpGDsMjFzOfvraytqAWAL7NnXrcPrxcwCYQe8tjaI
	40KI2CqIcaIt0jH9wK0GntRmSYxzztUx/9lzDyLg/XqSv6AXyk9+riRHAL+iXzeQQatamkLLqDp
	tn1/kqs/kUFOwU9mnucqQZN8+LH/7Aa6pTPt3EtW8z168B30TJAQxCUOvmOSX52vCsmFJuDIeY8
	kag4q63tfNSSm18CniZ4aRouwHRIM33vTCAs4P3X4FIgTyHOSYYNlC0p66tVVNRXhWI49nDUrJv
	FqFE3I4sBqS18h5Vb4l9+8AYUVX28HSgngS7m+9/qDf/nrCwoeAIlz241bu0=
X-Received: by 2002:a05:6214:458b:b0:921:1e1b:1e11 with SMTP id 6a1803df08f44-92134aae5b1mr274723906d6.11.1795554272943;
        Tue, 24 Nov 2026 13:04:32 -0800 (PST)
X-Received: by 2002:a05:6214:458b:b0:921:1e1b:1e11 with SMTP id 6a1803df08f44-92134aae5b1mr274723526d6.11.1795554272517;
        Tue, 24 Nov 2026 13:04:32 -0800 (PST)
Received: from [127.0.1.1] ([129.236.231.128])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92134a0a454sm142827326d6.35.2026.11.24.13.04.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:04:31 -0800 (PST)
From: Tal Zussman <tz2294@columbia.edu>
Date: Tue, 24 Nov 2026 16:04:12 -0500
Subject: [PATCH v2 4/4] gfs2: remove the remaining page references in the
 log code
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
Message-Id: <20261124-gfs2-log-folio-v2-4-f229e90c8285@columbia.edu>
References: <20261124-gfs2-log-folio-v2-0-f229e90c8285@columbia.edu>
In-Reply-To: <20261124-gfs2-log-folio-v2-0-f229e90c8285@columbia.edu>
To: Andreas Gruenbacher <agruenba@redhat.com>
Cc: gfs2@lists.linux.dev, linux-kernel@vger.kernel.org,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795554268; l=3235;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=OgZ2zeJfQt6UnNuu1TeQVqZhmgjPlO+0iv55uACTpZ8=;
 b=iHK2QTNfzT4MBkSVKE27B+IG3oZy06kk89SJhnWSw5WSqD7RgNhyfXEWm3QkJcdvEysp9udmA
 APClu+NXWayBPHZEA7dHJSQ7AX2RE18hryeS3ipkEr2qODvbcM3U7Pj
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-GUID: H-OuyGUwMW3epnbzfIldON9NL7YiP3TV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA4MyBTYWx0ZWRfXzbbNDQ2yEdco
 9qVLs9UpdLAJJjuQVa/Y7hXfDi3Zh1JW3YGfE6JB9xMzt6tLkLiDXXwUfco7QrsubCUYlbjYlhZ
 Bpf1W2FdeUEd3WR40/H+YbCCWLGdTfyJj1bJIhCefnIwY2l1EJmSa87rnBnYruccoB7JrQMyiH7
 caTDxe8Ycs+duazi2ZxSBGjYXQciB/ZCvCUxK4Buj+cLmnVwqUc++bH9MpH3I8lF7IvKiYmZOsl
 CwbB0wML0w9jbTUCc7w8nwz7q+WwYDMfUuSBS/J14+GvWjFdLjNY9FrSFWNJwpYnUlwYw/ngzq8
 FtKSuQQHQ8Y3rHYayofAY8RIJDMTTaeHDNmlvsdVoBIGZgQJA1cdnPDxJ7OiQQesi6TXLIyxCTe
 9yCqi4+ihLr4XCpfuDc4vUjKYjXtuteg1p1x8FNqVsV1myuBQV1T1TQqbjOdDLfdr3q0/DMHnuH
 ADho4VD3NuKD0Jf6WzA==
X-Proofpoint-ORIG-GUID: H-OuyGUwMW3epnbzfIldON9NL7YiP3TV
X-Authority-Analysis: v=2.4 cv=acr0Dhot c=1 sm=1 tr=0 ts=6b05fbe1 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=LNQXEAmb7IHcZyFqmLK0PA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=HpS3TJQ9O3Ob1ozEcmik:22
 a=RLOwVVqb4wJnjAl-1mUA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA4MyBTYWx0ZWRfX3KcXUhPQww9e
 b1kuxX7XUepUPAGS5wrV8vr6aVt9tVSzNg0C4JEVvXDV00OWqWPIBHS0WuSEFefvkgGz3fsBH9z
 nDuuNkScikxi+quSzlhFVgU79gI7PN3OT9NjfEzzUpkprpZKGTze
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11976
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=10 adultscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 impostorscore=10 malwarescore=0
 lowpriorityscore=10 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611240083

gfs2_jhead_process_page() takes a folio, and the comments around it and
gfs2_end_log_read() still describe folios as pages. Rename it to
gfs2_jhead_process_folio() and update the comments.

Drop the struct page forward declaration from bmap.h as well, which has
had no user since the unstuff path was converted.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/gfs2/bmap.h |  1 -
 fs/gfs2/lops.c | 18 +++++++++---------
 2 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/fs/gfs2/bmap.h b/fs/gfs2/bmap.h
index e3d6efdfd890..7b44cc9c742c 100644
--- a/fs/gfs2/bmap.h
+++ b/fs/gfs2/bmap.h
@@ -13,7 +13,6 @@
 
 struct inode;
 struct gfs2_inode;
-struct page;
 
 
 /**
diff --git a/fs/gfs2/lops.c b/fs/gfs2/lops.c
index 156d7c6341ca..000be5ec54a3 100644
--- a/fs/gfs2/lops.c
+++ b/fs/gfs2/lops.c
@@ -447,7 +447,7 @@ static void gfs2_log_write_block(struct gfs2_sbd *sdp, void *buf)
  * gfs2_end_log_read - end I/O callback for reads from the log
  * @bio: The bio
  *
- * Simply unlock the pages in the bio. The main thread will wait on them and
+ * Simply unlock the folios in the bio. The main thread will wait on them and
  * process them in order as necessary.
  */
 static void gfs2_end_log_read(struct bio *bio)
@@ -465,7 +465,7 @@ static void gfs2_end_log_read(struct bio *bio)
 }
 
 /**
- * gfs2_jhead_folio_search - Look for the journal head in a given page.
+ * gfs2_jhead_folio_search - Look for the journal head in a given folio.
  * @jd: The journal descriptor
  * @head: The journal head to start from
  * @folio: The folio to look in
@@ -499,9 +499,9 @@ static bool gfs2_jhead_folio_search(struct gfs2_jdesc *jd,
 }
 
 /**
- * gfs2_jhead_process_page - Search/cleanup a page
+ * gfs2_jhead_process_folio - Search/cleanup a folio
  * @jd: The journal descriptor
- * @index: Index of the page to look into
+ * @index: Index of the folio to look into
  * @head: The journal head to start from
  * @done: If set, perform only cleanup, else search and set if found.
  *
@@ -518,9 +518,9 @@ static bool gfs2_jhead_folio_search(struct gfs2_jdesc *jd,
  * our references to the folio.
  */
 
-static void gfs2_jhead_process_page(struct gfs2_jdesc *jd, unsigned long index,
-				    struct gfs2_log_header_host *head,
-				    bool *done)
+static void gfs2_jhead_process_folio(struct gfs2_jdesc *jd, unsigned long index,
+				     struct gfs2_log_header_host *head,
+				     bool *done)
 {
 	struct folio *folio;
 
@@ -631,7 +631,7 @@ int gfs2_find_jhead(struct gfs2_jdesc *jd, struct gfs2_log_header_host *head)
 				continue;
 			}
 
-			gfs2_jhead_process_page(jd, blocks_read >> shift, head, &done);
+			gfs2_jhead_process_folio(jd, blocks_read >> shift, head, &done);
 			blocks_read += PAGE_SIZE >> bsize_shift;
 			if (done)
 				goto out;  /* found */
@@ -642,7 +642,7 @@ int gfs2_find_jhead(struct gfs2_jdesc *jd, struct gfs2_log_header_host *head)
 	if (bio)
 		submit_bio(bio);
 	while (blocks_read < block) {
-		gfs2_jhead_process_page(jd, blocks_read >> shift, head, &done);
+		gfs2_jhead_process_folio(jd, blocks_read >> shift, head, &done);
 		blocks_read += PAGE_SIZE >> bsize_shift;
 	}
 

-- 
2.39.5

