Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795408379;
	b=PXpp8dT9mnATA9Fjy+SAzuXTpci79Xi8lRpDAZkH0Ux5nAsQa+qhcNAUSXNkmybZ4KKp
	 wQHMYLBPfvaJt5fHOf/0Oj1OvsX0k7o7or06q/RdDghFQoNRP3OOIz7nX021ttDMM5MgE
	 j8nyPB14WVq0fYOVorAt7rql0wFYu4lBsU2bn5wxl0JlYq7jDuOPkMycWV7Vb9PnhDcZU
	 /eD0VMlRR9y6aKxATJV+56AQGGy5PoeHoUuTsb9vyt7iaOxYFC5GPWPyb6tLfvdOE4vba
	 rOz6fhvDeiWxgWxI1sLB5obbnp8cuYrdwDsrwdKqHvINQjPf06lSL54V2SC921bSKUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795408379;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=n6lTulgBwzG9c14uvKtuf3cPmCAkua3atLk0tlPD/Rc=;
	b=shmZjaGF7w7gEKUR8vXlenTBtucjyCptQMUTaTicinoqFrBcn2Z3GNLoz1pkPDtO+GU1
	 p47W31ujrYiLnzIrX51zxxEAcR1qstN7yXbrCI4K/5+JMcmh7174UIitioNN65LYQxVyK
	 sYwKnvRCUE05GWjOOm44gyhdDUxAO4eN4Z4gsOh39X3l2wntWYl+zvW/Zb3GK7j5Ercun
	 /8WHBVaQeKjnqJzbwMArmJ/SasgydvTbiWBzvvDofy+wmDpK7ZMTojtx1tZMlfhxugdSp
	 AnPKROsUlQa5bSmq/aaHc5+4HVv9nt5ECtz227yhxlqRqtrC2j/ocNZPLio9Z6xYdag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lLXMCJQE;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFCC9606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 04:32:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFCC9606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lLXMCJQE
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2f04bea9a93so23426215ad.3
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 20:32:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795408378; x=1796013178; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=n6lTulgBwzG9c14uvKtuf3cPmCAkua3atLk0tlPD/Rc=;
        b=lLXMCJQE6I0WLYcKoR+jg+keAmfVboeQDbPgWlkFp5Szbwcbqc7RJ2d7EOCBP95qNt
         GDkQX9cmnBkB7U/QSmXhd7sG8kkqWGapIEdJK307p/8/k9Q7OMSu5RgjjH6o30C8hq0b
         SKJt01iAHLkNZrwSDVDM2GAPZHf5TFGpzDSBzvYlP92SmVlGM2N4KKJDrEqrW7B6KCBU
         8CkU0I3Rtv0hdxU3xlNhCD6Urd4vaEzF6GfHQLwjF4mOyBE3JpVRs7C/lS7ewY2GytWY
         s2pebJ1Zo0ws54m2p/JY7JOv3azwOC1vCtNz40h/8KL9lttv26nD7mey3/h4EfwOVhfH
         v7mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795408378; x=1796013178;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n6lTulgBwzG9c14uvKtuf3cPmCAkua3atLk0tlPD/Rc=;
        b=wRWokwqcmqJQK2oAe3q7nfc5QDxBa4a1S7kE7mmNf4mzz18dC9F/WimiwyANhYSoaV
         WnJADRRclb4WYDRqV13mHBW1d/2uZUBmQooiXtPfjYAU7zbyrNIEwO0MJzVCHJYoLOzn
         diDEvsq7jQKaTiMdlkqkI1D83kYIi/68GdGMHti9rTriZ5azJpbBJHA6yWZMl0DhPSOm
         /GxuwOKkWWqbMEbPL+nx2jrKPWIMf0UkuWH8PdR1xp6dffJTEHcUUqrpFaKDvqiGbSCl
         VoJLlm+O+maZ5ikgpQmhzRUWozoxXNeOFWO8zm++HsNiDMubylUswTvI2St6iKS/XOLf
         tuYw==
X-Forwarded-Encrypted: i=1; AL+hErEKU67mXNNEe5tkLhDpcdYj70pwkF0+UGFr35W8swYGV/B1GJsKgbdbXJVAYDjFP8fpVOnq0pCBhnZV8qM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9AJkYJx1VHvqUbfi87qsTLSIRmJb1KOwve/b6r6vE0/CT3GqF2
	TdFV4lxi33JwFJSuWaPyXfaSBm2MwoB9yv3HJ1b3z3xl9tNkDhDg/eXy
X-Gm-Gg: AZFdTZexLzctM1RxzzLGxbjhaLzktQke+fRzl09+O3uF9Kwg4phqUputZkd1ssxijbk
	OkIzLEs8coTuuwXtdD0ViZkRT304/7TJr1nV9zY4vG5VmCZuOiKL2a+UdbBndwdlN26E/vXmjQw
	8tBggSifknnSuWaK9YXZFcS806Zgsa34PbPsvXLkMDkQtkgQ7FT3CH46EFrjwr49tmlzJOwwJ0l
	otjqfMTKPDWezXcnmJze0zOgoVxGGTwz/eHGBIYmVXz6Ta50iznTMavjv562z8ogJ4hp3utIXWb
	wdOZ5Ejm2x/gdKQMlmMKGNiABiJ8o9dre7TcE4HbnhzEJ0p0ig/wwQ6G0zZ9Q/Z8cscaZay5IFu
	mTTj26Pi7NAV8SLxci5qhodckxAb0Ac4CRtX80KKb8JEXe0iDIhYxIfnXbN5o0k6c7xAM0lZqFP
	7lLTzXQ+ByZo+Qik8tj7xMyUTbBas0+URYtfyETqVwe8oUjI7q/WHpqyCA4S7bQ96zLUSnWVhNr
	DdKfUw8+jy7IrFQj+JMIUWk/NR5US6JhmEnIbXpD0bIWRNIp29Pprk/LZPrUL2n4xwhi0Ve/MQg
	4w3UAE8uqDNTCTITFYBV/NYJkOi+thLTCI1En6uQCoWensXXjlyJSij1PA4kRw9eECzssDmZKuG
	INGpfIZb18RMk7I/6kM5aFSK0QTrmEmfrO/z/ardC1eSR3RtCswHTZoiWLR2j5djk78Lnhg==
X-Received: by 2002:a17:903:2410:b0:2e9:460e:ca4e with SMTP id d9443c01a7336-2f03efb1371mr108380535ad.1.1795408378276;
        Sun, 22 Nov 2026 20:32:58 -0800 (PST)
Received: from DESKTOP-G3E0OSP.localdomain ([58.224.60.243])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f105b76sm45389145ad.50.2026.11.22.20.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 20:32:57 -0800 (PST)
From: Jinseob Kim <kimjinseob88@gmail.com>
To: yury.norov@gmail.com
Cc: linux@rasmusvillemoes.dk,
	akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] bitmap: keep unused tail bits out of bitmap_cut() results
Date: Mon, 23 Nov 2026 13:31:52 +0900
Message-ID: <cover.1795407826.git.kimjinseob88@gmail.com>
X-Mailer: git-send-email 2.43.0
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

bitmap_cut() can shift an unused bit from the last storage word
into the valid result. Patch 1 masks the copied tail before
shifting and corrects the existing test expectation. Patch 2
adds checks for partial words and overlapping buffers.

With identical CONFIG_TEST_BITMAP sources and configuration on
x86_64 UML with GCC 13.3.0, the original failed 21 of 391,596
checks and the fixed version passed all 391,596. Clang 18.1.3
compiled both modified objects. A 32-bit kernel and a
Clang-built kernel were not booted.

Jinseob Kim (2):
  bitmap: ignore unused tail bits in bitmap_cut()
  lib/test_bitmap: cover unused tail bits in bitmap_cut()

 lib/bitmap.c      |  2 +
 lib/test_bitmap.c | 93 ++++++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 93 insertions(+), 2 deletions(-)

