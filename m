Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795165234;
	b=0jOMerBiBUHMawGXMNvay4UxDR9PVWkdiOQXCoao/ptJrgZmCjfoZRVU+ZUo3IUiBG1b
	 JhY1bbZthj4yerIXoFufEN9Pn4WMusD4fBIbhyBndtqt1J4V8l6ek5EjSl0oxwBu3/W4o
	 D1abKyAL1En6TCUnDa0I98u+6A+J5//rmt8KEbtMzintLAV3GGxj/q/3GSichw9t9b+q0
	 3boFZp99LNRYnoAR0+g79c56eBBEBAw+poh4MQTfHLYTnnz1hNKMZdYjKiif9cO10MJ5u
	 NpBJT2S0ZzGFrXPcLGVFMZ86hs+jgFGnVX7gi8CvjlJQaH5GqA+YrzC28+hOI+Frp+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795165234;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=uRLlYOEziP+a1oXd/cGM2I2LC+HLInwDhPv3Q1J/hWc=;
	b=I3wS53UYbHQ8pky3ueVLBf9ho3SY9S1cu7fuVse2uuZIIsNGun1Emyw6/FrqgHvoZr6Z
	 AKj1FUUqGdqs0poWQdUiEBizgBD3UMCo4JHl7aCOPxwkl/3Z8ass8XG6I2DIhBzq7LByv
	 Y3By0U729lA0NQhr3t0IBdjYe2MGNLKs0mdPyKcrnwNdT18az4VWjstquK3G6xuMxejJ/
	 4OHqFOLG8FhHYuUeZssYqfylJkAyYLlkY9gJ/Kf1yq/PAPYLDKQ8T2Z3NtBiGDtoEPKCg
	 YR8/pm2EOrq7uZiPg/7OmT5JIf30QnQ2ceiSGxArimhgtYMQIPL5D5jggSjMo461PvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MucD5h4A;
	arc=none smtp.remote-ip=74.125.229.135
Received: from mail-dl2-f7.google.com (mail-dl2-f7.google.com [74.125.229.135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F767606A32C
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:00:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F767606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MucD5h4A
Received: by mail-dl2-f7.google.com with SMTP id a92af1059eb24-13985f8229aso263293c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 01:00:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795165233; x=1795770033; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uRLlYOEziP+a1oXd/cGM2I2LC+HLInwDhPv3Q1J/hWc=;
        b=MucD5h4AIQ0AJqGbNtCpVYblqZpdkUvK8v3R9eZt10f8zMkw/ORab+h7idKrGQQnfw
         vFyTj6xewtg7F84nVHtZP51D617be92xfDS3iCpnh1jGC6YTnPmAsmLOV/m8lQ2/11xN
         Bd2GOJLfDfb3Suq3VJY8M7tM6G3qn7lfgBdzK6ZgWxiZerpn9ear4fl/FBGDo0NX7NeB
         z47F/jLOjl8Jpw22jGrm27FG4OZ2TEbQiUZh3Fhd0okpvagqettX5GYAns/v211STXtB
         MAu1fOnoHJKCR/zaqzZQUVyGezrsi+hy96HMRcqPX2cR71xjfNfTdstUa1AsVsdhrvj8
         2bXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795165233; x=1795770033;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uRLlYOEziP+a1oXd/cGM2I2LC+HLInwDhPv3Q1J/hWc=;
        b=qd7aUKY7e3HtLmraAwg2EpIvTmTY0XH+i8ZozsU3X9UcM/D4S3ybYJ6nGahmPj/JYY
         JVCs4F33DRSaGzoij/fVZQ63/bb4qxeuvfpQrRALFliKQNFCWvN8iirQX8Q8kqQc70jf
         W7q5bDd8eOV4BUrupjKZhQ65CKcDGO2Ew5PJRrOBV2u0YceULkV1rBwAhUy1qQXKd5fw
         pdlTri+2at4D1PyaMngVpz8i/ZaUXjvg1FQUsz3SugSGnc2aU5QNa5WwSbFiCki6cdXw
         DUmurjF31BURvyqimZmam3Ukt1CM/LEb3BkhNrw7LhvXEsONlueGxPL1Sgn4EohF24Pu
         4bnQ==
X-Forwarded-Encrypted: i=1; AL+hErFxTLlVLgijWbg/1kYvzNE/ZRT9pGlS9klr+SM+AXJnC2R9nrMnBe7v+YUcI294HcuIk5OwWHmetpV8mlk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/szs9NXD3e3sNQi+3mcVhfdr4DWcjhGXkK9aCgk1Zl4GN3kSjb
	0AkEDbZl4f+KAqj56J7zWeEWWyqnJ1Phm9J4hKJB/UkrFOYU3UlC6m7m
X-Gm-Gg: AYBFou1UVgX+aZ4tveoXeX6C9YQgj5LhU1ZH4v81YVqPvlVFnk0MSI3wcmrXIYKNwVe
	Kx/xoOCCcuBpOEdplhBZKD+wkDIRtKQeVEExsjzAeMg1zd3Mbmj1B2Z+EzMNblT9CBC/KPgdXzo
	DjwF1RIAxK/ahVaIxJuSwhn9juJZDMMbXdI0PfQ/8zR9Feqpr2SS8lQ/w6RbjQC5vvi5rzR+9GW
	qrkLmlSheUTN4027ZfS9QXHoPaZGglleK1/khNTNZYU6EnOE2zmCk/tQINIq6VjBw4L/yZtCysB
	pvSNiNmP+FqkxTQCJv5rwe59rV3sMY3VF0aHuVNnXUONyJPGioZR211dzChu86YHn4sVErDHBnn
	PrPPfb9CrdZBLGHOcFgOTXa+jbZ1yJJEsAgWmioEphD6ionmSO1IivtMUWisykDLZ4Rixa3eHvR
	M8oxrQGBre0RuQS47bs1Wrol0G8FZp2zGG8Q3/+0Hq4MR0gIkxyzjOOEUyYuhxzcDvl2NXQkhZu
	xpWlAGB/V4td8M5+bO3h1R3BMMPvWerhAwf/qYbgrzyCWGOEJKayZv9Qs40NoE0EW5XzcTLw74f
	TZdJ0d3p8ahTZdDFZXkpvxuf1wQRUiE8FNNHYpyXiL2w4brJ2MI4HMMlY2hxyCdO0h791jTVJtY
	iszV+6mugBhBF7mD/u4uBfNpg4c5wH2XSTK1FKg==
X-Received: by 2002:a05:701b:2616:b0:1b3:ba92:145a with SMTP id a92af1059eb24-1b5568e0a27mr2106719c88.19.1795165233115;
        Fri, 20 Nov 2026 01:00:33 -0800 (PST)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55681301asm5189502c88.8.2026.11.20.01.00.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 01:00:32 -0800 (PST)
From: Hungyu Lin <dennylin0707@gmail.com>
To: tony.luck@intel.com,
	reinette.chatre@intel.com
Cc: x86@kernel.org,
	Dave.Martin@arm.com,
	james.morse@arm.com,
	babu.moger@amd.com,
	ben.horgan@arm.com,
	fustini@kernel.org,
	tglx@kernel.org,
	fenghua.yu@intel.com,
	josef@toxicpanda.com,
	linux-kernel@vger.kernel.org,
	dennylin0707@gmail.com
Subject: [PATCH v2] fs/resctrl: Use open-time credentials for task move permission checks
Date: Fri, 20 Nov 2026 09:00:22 +0000
Message-ID: <20261120090022.44526-1-dennylin0707@gmail.com>
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

Writing a PID to a resctrl group's "tasks" file moves that task into the
group. Whether the move is allowed depends on the PID written, so
rdtgroup_task_write_permission() checks it at write time, applying the
same cred_ids_allow_move() rule as __cgroup1_procs_write().

It checks current's credentials. That may allow a less privileged
process to trick a more privileged one into writing into a fd that it
opened. Commit 1756d7994ad8 ("cgroup: Use open-time credentials for
process migraton perm checks") closed the same hole in cgroup by using
the credentials saved at open time. rdtgroup_task_write_permission()
still uses current_cred().

Use of->file->f_cred instead, as cgroup1 does.

Fixes: e02737d5b826 ("x86/intel_rdt: Add tasks files")
Cc: stable@vger.kernel.org
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
v2:
- Rebased onto commit 27369da9c651 ("fs/resctrl: use
  cred_ids_allow_move()") in linux-next.
- Dropped the comment change.

v1: https://lore.kernel.org/all/20261107093253.62518-1-dennylin0707@gmail.com/

 fs/resctrl/rdtgroup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 6e81b58e4cb8..c9b35fc2b513 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -725,7 +725,7 @@ static int rdtgroup_task_write_permission(struct task_struct *task,
 					  struct kernfs_open_file *of)
 {
 	const struct cred *tcred = get_task_cred(task);
-	const struct cred *cred = current_cred();
+	const struct cred *cred = of->file->f_cred;
 	int ret = 0;
 
 	/*
-- 
2.43.0
