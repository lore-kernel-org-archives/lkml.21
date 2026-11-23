Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795432035;
	b=4PWb0jWTiYBHCLYVY6cmGLcJeioUKTbOuv9jaGnLHZ+H0K3Bm34qh4GLF+3vqxE5BX5D
	 6LP70IyiSeVi0qX48CF5cB4w5FQeC3KrmlADqWV4SajFOq9XzRk0tD0zHuAKVZOmdGww6
	 4ldSjgsdbJyGgJCRNdu+V1LOmYPg9s1WeGd/Uu9K2Rg0eHVfO7zXGmjByHPXx5tX2xDI8
	 xv+W03vVZQ8Mfu7yOf9cIXwegxQdLxPlzGnnzBKjxhG42YIcPAesU3kKweajWei7G6/ej
	 fI17HD/a0b1a3XlCytQsLupE9syOZKDdLVKAkmNI7ofNe1Ph2QsQdzeeZFwqzoR84xA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795432035;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=SeUaiyfKEAoES+ObZcS78Ct3jO+/x+qSRYLCaqY+cv8=;
	b=iX0hIa/fam+dvJb4hPWZaHokv+oMPDe/uat6crcGQrCGdzOY/xBQQTj0tUKtdG6F9XbX
	 ZD5ydemzZwXYhqm0DjC9cXdEqbWdI7w9sxsYRE5SX9HSdxO9yaeNz1icpESOak1uaJrEr
	 C80IEgbLyZGfkamBNqeLnW2DeA+zHZPjvioLZsZ8OSWKXkHL4sl3xMkC45gumDhjp59vb
	 6AL4xnoKQ0PueuCrEbyHLK4+z6jRN3n/++SCbbVOfMNQ01AUYn0HmtZiAANTO49J5BPv3
	 p/zpqywVMZLrL4PtBPP08QlrQD7eZx+h0FEU3QDXNHWxYEpvzjUmH6ylf23lCiWGE7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kQCyuU9G;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ECF3606A691
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:07:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3ECF3606A691
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kQCyuU9G
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-386b3524415so87735eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 03:07:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795432034; x=1796036834; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SeUaiyfKEAoES+ObZcS78Ct3jO+/x+qSRYLCaqY+cv8=;
        b=kQCyuU9GHqzQJH+49V9LZvLharPnNIo5YMq4CYAqDqS7lGnQ2OSaxNgB5Deh9RfEnx
         LA8oHTufZm98vtJXiYzW4JYwoLl6FrFNlaDhaLn9HwSxp9FPt6lAP3P/6LHv8zd8iOkw
         AxpZjZ3pcu3apemjvntmkyItq0DOyWeOwB0F1cilkHX6NA3ZCYNdeXfZTIyDL5etphSX
         I2yWm/NCQwR/5PjZEDzrxA/xXJtJJjAd22mkG+7SUmqJTbeuzmBBABEYmg44fweHpUm/
         blFH65dGDHFCYLFyEFmYnLZccK1mCIDdBRIGL/fcoFDiQIluXzaswu+9cQEfYizVV+sT
         zcTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795432034; x=1796036834;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SeUaiyfKEAoES+ObZcS78Ct3jO+/x+qSRYLCaqY+cv8=;
        b=DD5EtclUPDT8fN9pXXagq7siZVrECfHpOZ5zn+83JkJdfk1/kcfoQYNU/YFCe4TTO4
         8iTOLd96Yqg1+xOlbEqq9i4ZdsfeGXWUQBH9WVayjf9gCylGmRjs+yT5B3/Aq1a4YX9G
         1Gs4atTbpt7QWk3JhOpqFQ6Q8jD2JNcNV26ynEBn4itv1Buc7yDX7uRuwPKv9yRmuevd
         93CfsVnX6QEDjgioCJKJOQmCYixJ8odIneIu66z7VlfVVSCqTGX3vmo0imNL5WcpM7uw
         7HBmCQO0W/RhiAvAe+CWXy0jsU3iGrS07brRJfO49Y+z6nrnQWzNyjNxA71g+PfBvj6q
         fPRQ==
X-Forwarded-Encrypted: i=1; AL+hErETAmHLrdFwq3oT0KAzkE9cA8TprX7f3bi4y5N9OfmsECuZ7QTXrem3yk+11WiucWMbeuSZlG9yO0TYsvU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8TnvN0yM5OyRAojsV0ADYzQth110LFEVOUMRYbEtgHqqyP5mLL
	N5RctVKBu1E9F+MKXeyDNoOvpeJHGsYGA9oPn2jrxF88PMn/I/R6+WxR
X-Gm-Gg: AZFdTZdoT0MJQyIQ7Fq+UyuZ0XJ2+5Rh64PuySrgUAVFlm350P0YsfPrsNklio1mH8x
	9u0AjcnJOf8EYh4mbgBrGTKAPSeod9EI3wFdcNIUNv77ynezr2I7jdXs9OmXNRoYWShlcEk9mHl
	jXhyOhcriCbFwuhSes6y8mvSXD7aLx5YNUrNwUhsA3ieY5o82OFY5numa2ahUR77T89TDeGZinD
	b3E74NzlbO2ruuJd0cZmUjvcXbTBu+9Kyj+NO05fBKW/Zp2fyydTZa8kX1SYBp4WNQN4CKQYQAe
	QfoM4NVvGP5k0umLfiqQsyLX5ItYrdXW/7DGM8qLovtTSvYkEpVRuuVOYNrBNBwtLphDTPnCaC7
	0t4t6KngzkUYMz6TASbYAhEwcTX+UwGOJv52CeghkjhagHkV+edq9wBjLAgcsYGslntLw2Va9Hh
	xwUnoU4+09pHVvjcmrtZO3q1CNH4hvs8i4oOFI7RmFgp1EMSf1bKllZDUlGHgNK/b/j2Ou+FZ9X
	My/T6FRNB82MLTKSK/sSyOHWRZ0ACfSkzfCgbiMfJ1q+ca/OeLXCtg0K1wS1zPms6xmM2VYaRW1
	VD9YBIFstLuMUFbCRAUe2t0SWlhuwXRNvnfCs4nIASut/UUNGrwgFtOILS9se3zgM87vpheGkh3
	cbLu1imDKNfKaR8Gav5UMSMHqsYM42Ka62sra+7qwDaKnNQ==
X-Received: by 2002:a05:7022:7f12:b0:1b4:fc41:3b2f with SMTP id a92af1059eb24-1b5568a1b89mr15678115c88.2.1795432034218;
        Mon, 23 Nov 2026 03:07:14 -0800 (PST)
Received: from chenyou.ncku.edu.tw ([140.116.19.16])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ff27bsm30054074c88.6.2026.11.23.03.07.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:07:13 -0800 (PST)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: alexs@kernel.org,
	corbet@lwn.net
Cc: wy@wyuan.org,
	dzm91@hust.edu.cn,
	si.yanteng@linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH v2 09/13] docs/zh_TW: process: add maintainer-handbooks.rst translation
Date: Mon, 23 Nov 2026 19:06:32 +0800
Message-ID: <20261123110637.172045-10-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261123110637.172045-1-chenyou910331@gmail.com>
References: <20261123110637.172045-1-chenyou910331@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Translate Documentation/process/maintainer-handbooks.rst into
Traditional Chinese from the current English text.  The
maintainers-profile-toc directive is kept as is, as in the it_IT and
pt_BR translations, so the list of subsystem profiles is generated
from MAINTAINERS.  There is no zh_CN translation of this file to
consult.

List the new file in the toctree of process/index.rst, under
"Maintainer information" as in the English index, and drop it from the
TODOList.

update to commit bda185c30593 ("docs: maintainers_include: Only show
main entry for profiles")

Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 .../translations/zh_TW/process/index.rst      |  6 +++++-
 .../zh_TW/process/maintainer-handbooks.rst    | 20 +++++++++++++++++++
 2 files changed, 25 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_TW/process/maintainer-handbooks.rst

diff --git a/Documentation/translations/zh_TW/process/index.rst b/Documentation/translations/zh_TW/process/index.rst
index 8c558bbf30e4..a4ae46350636 100644
--- a/Documentation/translations/zh_TW/process/index.rst
+++ b/Documentation/translations/zh_TW/process/index.rst
@@ -103,9 +103,13 @@ TODOList:
 
 如何找到會接受你補丁的人。
 
+.. toctree::
+   :maxdepth: 1
+
+   maintainer-handbooks
+
 TODOList:
 
-* maintainer-handbooks
 * maintainers
 
 其他材料
diff --git a/Documentation/translations/zh_TW/process/maintainer-handbooks.rst b/Documentation/translations/zh_TW/process/maintainer-handbooks.rst
new file mode 100644
index 000000000000..1a159fccdbd1
--- /dev/null
+++ b/Documentation/translations/zh_TW/process/maintainer-handbooks.rst
@@ -0,0 +1,20 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. include:: ../disclaimer-zh_TW.rst
+
+:Original: Documentation/process/maintainer-handbooks.rst
+
+子系統與維護者樹特定的開發流程說明
+==================================
+
+本文件的目的是提供子系統特定的資訊，作為一般開發流程手冊
+:ref:`Documentation/translations/zh_TW/process <tw_development_process_main>` 的補充。
+
+對開發者而言，下面列出了所有已知的子系統特定指南。如果你要貢獻的子系統
+沒有在這裡列出指南，可以就
+Documentation/maintainer/maintainer-entry-profile.rst 中提出的問題尋求釐清。
+
+對維護者而言，如果投稿經常忽略某些特定的提交標準，可以考慮把額外的要求與
+期望寫成文件。請參閱 Documentation/maintainer/maintainer-entry-profile.rst。
+
+.. maintainers-profile-toc::
-- 
2.43.0

