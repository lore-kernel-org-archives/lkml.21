Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795186814;
	b=uROJAGTsMdt7neZ7uIMf9UbNRlXLKtAxQlljBk8qDLyMHMt39aol95kBcdfCKH6YTkN2
	 EKRyaCA6aBqFmCsFKWyktxCZ7nuRp9nqEl0Iqi5x2aepou5ksxrfccnezT/BUc5wqIqOt
	 o9WjRWtxIR2aTuplaH3Idf6qcPRg/Eypm/RHPFmJb1XpjxTf7K95Q9TL2WiCnPKALF8Ya
	 I+aah+qDiIhHFt+7bjJY1SML1j4zipCANIAfO7xgqUcouSffbumnAGHAw8Tj8t0cug96D
	 mEcOQamR7iT/Xe6lQhpnx1JxJHc1UEgaBbcIIeVHTlvfFS5Ept0RFujy8WYmnUP2KJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795186814;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=v+oh6shJRKf7A9wJO4PoFZ9vW+2n3QYIiBlJ5JRJGZs=;
	b=IBGIqWJyHPtbUgKHSYa550nMzMfZIjUeoqSgL7km1UBfvY73XtZjHZRnY9MEh4K9rk+a
	 DhhyZ/BQVKwthM/1zSo+rtY5VAaSeQ0dE5CWGMsvqv18AMyX/npLEgN5kaX1VJUupEO6K
	 igHclI1j+Uo7yvCGyz75kQYjLmwxOeAMfJenR+GdLes1lKHr/AHvHFmwyFEMDBggSOHol
	 TmNZa3q0ewLFeC4LNsnwSLTmNXCd1vpaxKt8avKClP3IXo1VktT0N2lbF4QCUfKVzfQBW
	 U4fXmxMLUvN9++8v7UJREYGP5Mq/rHd6q67UfvGn1+GehdIRi5EV+UvG/quiFb64z4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nMa5ZWj8;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F6C606A332
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 15:00:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8F6C606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nMa5ZWj8
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2f0481b35c9so4059485ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 07:00:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795186813; x=1795791613; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=v+oh6shJRKf7A9wJO4PoFZ9vW+2n3QYIiBlJ5JRJGZs=;
        b=nMa5ZWj88cDK8UCKTAXLL79x4mE44SivjLt4vy6BI0lNO4TFHRhk8NMm/9lJapbFLg
         Q1j7TFL6yKUoG9hQK2RvEs5JKms4IFyP41a0gsrcfjmdQu3RD8yIALjjnyd1tLqMtjyT
         TalZZPAAi1tetkZQ1N7chk7UmXzDoerrEzLXH+pic4bNxGWXBgrRyyaip8Gy9ViMdzjv
         FnR7E1fROZslFjgWm+FPcEGYay3Q9N6XNntIU84PIfTQE3/zgZwnVgNNzr/b5CwzKD+J
         XmI9NIF0EaDl88qiWu8VCxJO+0OPOJ/mypmSWULwfc6KdJ059hOfg23qpBB8J6LnmT/2
         w0ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795186813; x=1795791613;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v+oh6shJRKf7A9wJO4PoFZ9vW+2n3QYIiBlJ5JRJGZs=;
        b=h1QyzZ5QjnJjBho6HVJRypa4wrDhMZ40GPiO9jpPEjb0CTbw6v9yDt2VB8zofKlrS8
         J2RqnbiQ61RHx5OuTxbFuk2gCNLw6/QMaSS3mekkDrz8Ef0XnWPHNZxWLMg29juDgoL9
         EsBcrowaLHSMFL9laz1wH8LpyoS3V5mU6I+78iWnrmBboAfDDRCEpZD5e3YkUCTyb+Y5
         spegTHhsDHu6g9dYDu2GGocggODgOhkA/KhvJGNfZVlbzHa/hVWk6YtC0oY/5NBAdiz3
         3IX85PdNC25H9Uq4EEsAcrFKWtpmdbf1Q/uFP5b5tZSSx+u88yC0doVP7ZntJhSs6koz
         IgIQ==
X-Forwarded-Encrypted: i=1; AL+hErHJlV9xjwIIBybJxnowZXXWHO6LOE+zfkV/0d9e/DuVm3mtXyOKEWqwtVOusOOMbBifc0yjFL6rUlZLM4g=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Shg4zddIo5X79Nf1EDKayDdEezGGeDL7d6aL0AEaos2myd2G4
	Llbts3+GDXIs3kFHQRdmOpDJWsA1ivgJmSY6uq0j1DCFVJ7FYoHCb631QBd7pg==
X-Gm-Gg: AZFdTZeGITtd/2DaTfrO8If4iEG+vZHFuGI8Kqhp89snfRB/vTjsWdiMgErzv+agMf7
	st3xQCB8uw/oq0uKTqVvFJOREynSu9sa3RTE8YV2wrpOFOAyf/JoC6biahBuh/Er0aGBdtfJZzh
	AM9Ejj7PLkEUaRimHzhLeJ+Y5htI3r5gSSKR/QjlHZkVHVfpIAXCOUNv3iiPaJQX2opSGqxnIR6
	B/I7603Fjx6Gn5VPd1W8+la5YLOemzoxGr3Anslfq//GcINHCSY7lM8y3Mv5mI9o7L9aUZkPi3/
	X4+cUJNUM15k3gRscI59/o4+z3aw6rRXqvWiLMdv0mNToS/8tfIXGNVgrC8cbuZgwn5/vx5ADQw
	9BedCBtrKvh3wuzNAJbswILtb5GX5SJLOLCqyhjVFDZUGbn9qFKeL6rxmwozMMmWPeP1u2GAJHf
	YSF0dBcd/O+UvXjFVLk+IPiNRZ6zQxXCTGS+xTsfQJc2qN99oiOt/dhTOXu7jXz971AOUL6l6Cw
	v+yMdaRv3RE1GhWK1CYK5AhdR90wUi5gxM1bqy6rh4QReul6Q66SOyG1alt87lJ9sIQSeNKyC77
	uV7Ra8t2hwxP6gstEXzByTWk9ltjEL9l2pNjZfAU8otdUMLlv1Musw==
X-Received: by 2002:a17:902:ea0c:b0:2f0:3123:899c with SMTP id d9443c01a7336-2f03f0c1f37mr34277685ad.5.1795186813059;
        Fri, 20 Nov 2026 07:00:13 -0800 (PST)
Received: from ubuntu ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f120282sm15213005ad.59.2026.11.20.07.00.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 07:00:12 -0800 (PST)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: fuse-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Luis Henriques <luis@igalia.com>,
	Miklos Szeredi <mszeredi@redhat.com>
Subject: [PATCH v2 0/2] fuse: schedule dentry_tree_work only between dentry tree init and cleanup
Date: Sat, 21 Nov 2026 00:00:04 +0900
Message-ID: <20261120150008.1144420-1-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Hello,

inval_wq_set() schedules dentry_tree_work when inval_wq is enabled, but
it can be called before fuse_dentry_tree_init() and after
fuse_dentry_tree_cleanup(). This series makes inval_wq_set() schedule
the work only between the two.

Patch 1 defers scheduling the work until fuse_dentry_tree_init() sets
it up.

Patch 2 does not schedule the work after fuse_dentry_tree_cleanup()
cancels it.

Both patches hold kernel_param_lock(), because a sysfs write can call
inval_wq_set() at the same time.

---
Changes from v1 [1]
- Hold kernel_param_lock() in fuse_dentry_tree_init()
- Add patch 2 to not schedule the work after fuse_dentry_tree_cleanup()

[1] https://lore.kernel.org/all/20261110150250.71520-1-ekffu200098@gmail.com/
---

Sang-Heon Jeon (2):
  fuse: defer dentry_tree_work until fuse_dentry_tree_init()
  fuse: do not schedule dentry_tree_work after
    fuse_dentry_tree_cleanup()

 fs/fuse/dir.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)


base-commit: ab9787d7e66ac7e6e94fc975b37c5b56fff98ca9
-- 
2.53.0

