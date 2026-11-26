Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.196
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795668756;
	b=fbmcplc8OSWm1fj/GuPUhoHWZsnuZa7UaWH8SxYs6YqH5GUaHrszXo53j4UvEtxC+WEO
	 bu7tikHRQZKrTIJjzV13jS0w7vza2jbO1NanzzNbGW3IEShh4UraTbShy+RGUuejHD6Ca
	 qXKu6SXKvPzNhfZpfU/Q1NBgw/z0j1oUicHL/MK4OH3VhbAinwn8lQe7reeiPZQPVHzXx
	 cqWH2uGrLrzLSHRtb23pfSbGJJJX1Q6r938zRcEZmgFX9YJ/quyoAl+raaDqCCnjqd/zz
	 sXnjZRPUDxRoJVSfCVWblZuDg3N8Vy2/feAEiE7X53iQuY/KCgMyl7ocTraLIpOAMVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795668756;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=lqulBbTwbeeixwOkIu5Oj5QCzLuwttc22xt7NXl3CCQ=;
	b=hh5wEnfmJWKLla53mOTb44bft8nVMNEam1DXTfnSjnpepq+XbwWOt3OlxLAJEUnSGzio
	 F5YBS3nv4wVzCNTDMUolmHIOhxejJ+aYYzI+spAhAlzrxhn+Y7cnPEa1lawGQuIznBaRA
	 Ar56cZxfZdOEIxtud33WdLMGMahim4I30gRtNqbPFZ1Z4ZHR90ZulYU1RLQUKToFNpuR1
	 +XkoFkovagkv7fKqPPu1gOFKu84MZ+oVpH2TTj1VtF7VFPIz9b7Sq/+Lex2KmxJnsR/pT
	 8M2g9kWKKV+XjCHOdnXcrGa1/EcojwE/m0maURu7nvqL8Ul+YcAB9pXfkAlYYEACYNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DvZFstsL;
	arc=none smtp.remote-ip=74.125.82.196
Received: from mail-dy1-f196.google.com (mail-dy1-f196.google.com [74.125.82.196])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 321E1606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 04:52:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 321E1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DvZFstsL
Received: by mail-dy1-f196.google.com with SMTP id 5a478bee46e88-3869f03af6aso5776616eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 20:52:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795668755; x=1796273555; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lqulBbTwbeeixwOkIu5Oj5QCzLuwttc22xt7NXl3CCQ=;
        b=DvZFstsLLK+1xG2KigY2VDKpJPTRqwgiZVAa8LjS9LWMHgwIkWFfzK9gwhucuxJ83h
         u8PcYAek+ZQP7EgnB0jubD3AQayrOoCUq+ot6LSO+dJHlWbIMkvCDWgPsSqydJ8zverF
         PlBiZSYhO3SkLDB4Hj90SZuhvGevAEzWBmYnuREYnm0Vi9mmlvYgKnMcfRxBaF50P96/
         nAGrjcxf3wPQHXHJtj4tQuMP4URAiv+T8ou0Y5tdou+C1+gGde8GtjxGuDUWCZ2CLMSw
         LKhi070BRgNmwzwYeEIR4RqeJnvKe2bYPy2PZN6iJcEqreKL2Ea2Iipr25q3p+Q+1HbX
         VN7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795668755; x=1796273555;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lqulBbTwbeeixwOkIu5Oj5QCzLuwttc22xt7NXl3CCQ=;
        b=LDpIavqcJV2nmkKXleUT8JtJEc95NbuXNHAKnR2XOeY1DZpdfydZoCfa9kVjdVcrTa
         eXgZ6ehGGL19y8Arh0iPl4N5hKg4X+coZbUyOhex2K2FG+/SMYg0CGdwdVFCx5u/K+Tk
         +YvIQ81B27Pnt/I++GW4wHv383mmOUlwrJo1DD6n8Ip3b9dA2/bzdDD9lZ3FId+sy8Yn
         MC8mfuI5yvl42I+p+t1AnaTsK3L82wCUc2WUeZiaZov7fmbdwHdBeQy7jhGmqgub5ukY
         MZOk8Kc0TUllc42tRQBaIthmhmewKmb0ZxLDqy97zDAR3DuXnWJbgnb76HrXRsc+tw70
         yv3A==
X-Forwarded-Encrypted: i=1; AL+hErG+IXdXNMf90vAuTWx9ufNwG3T+JgJHIVLPP2PrlB6gCWLOF0jy4NjtomRPsaqxtAnu8z5jb793ZazN3cY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8cjQxT0LHbSuaaY8YLT+isYbzYpnfNz8EjhBu9iCXPJvrWsEO9
	UrsHuiBD27pLK16/agDay2t3wWoTG1RJ+crxHyRUFFy/BTnw1xwQTi9w
X-Gm-Gg: AZFdTZf+WAVNDT9Pfo7O+dcme4jemkjhujDM6+lXPw7WStcvm+XcCxagQCvYf40Frxf
	4L/qX4Ru7yypE+oD2yDKZnRfXMbkkKkmReS42lqhVcpCBm6zahdjJ1MjdeeIjnYw4FmEn2lbcpz
	XtyGe7yTk0u2nluSPfwmqNxOvsDk4nIPQNldYJGaBqALPTr9uE8D0S1gJ9dXNWfnGHCj5MfHhYK
	Hg7W/Q8KuEn2r2BMQs02GIwkvw2LihKuiUlLo1lr0SmjEhK+guLk/gVaK/mOr1iDVvtvKXQAOpe
	A3JRLEShi8e30adUeWCvrceV87vsGhhRPOk1VlbYLxsm43/b2YMfNpYfri/XfrZ5UnjATgxUW+E
	/LeDIuXh8WYQRk5meeXFhzLW+VMg99CZQqFR7AyjBkFEADJDyq37vkyKDGEwnWiswoCGDxkQBWy
	CI+YGYk5N85YU4qGaHfNFp/a1PrJHp0kVFJZbCeL1FoMACt1voY/nHtTNQzVfnCZLsoK1Eozuwx
	nQ01iAFxdj6v3IfFbuW1DORgLbBD867RjLwIUNFf6sSlKAHmTb2DbVH4pjSkJ1iv3V5znB6jOON
	0K7T0RHs+WTTdVHb/7WDwg2Slcxw6CXsZZVRbw3xbhqktKW6n1aIX938qrhJnUaGgY3dUKxEn2s
	FhMa7QiVfdCOqHw9uHKQqZuq6fRMYNH4odLmUHgRDu9zeuZkXqfh8UgnDvX/vVQ==
X-Received: by 2002:a05:7301:a0b:b0:386:a416:6c91 with SMTP id 5a478bee46e88-386a4166fdemr14329337eec.20.1795668755200;
        Wed, 25 Nov 2026 20:52:35 -0800 (PST)
Received: from localhost.localdomain ([76.33.234.50])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386aaae4960sm31450572eec.18.2026.11.25.20.52.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 20:52:34 -0800 (PST)
From: Hungyu Lin <dennylin0707@gmail.com>
To: akpm@linux-foundation.org,
	brauner@kernel.org
Cc: adobriyan@gmail.com,
	jannh@google.com,
	oleg@redhat.com,
	jack@suse.cz,
	sforshee@kernel.org,
	me@black-desk.cn,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dennylin0707@gmail.com
Subject: [PATCH] proc: also check the opener's capability for oom_score_adj and oom_adj
Date: Thu, 26 Nov 2026 04:52:22 +0000
Message-ID: <20261126045222.20770-1-dennylin0707@gmail.com>
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

__set_oom_adj() checks CAP_SYS_RESOURCE against the task that calls
write(). A task without the capability can open its own
/proc/<pid>/oom_score_adj or /proc/<pid>/oom_adj and have a privileged
process write to that file descriptor, for example a set-user-ID
program that inherits it as standard output. The write then lowers the
value below oom_score_adj_min, down to OOM_SCORE_ADJ_MIN, which the
opener is not allowed to do.

Require the capability from the opener of the file as well as from the
writer: check file_ns_capable() in addition to capable().

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 fs/proc/base.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/fs/proc/base.c b/fs/proc/base.c
index e6d54193b9f5..42e4645899fe 100644
--- a/fs/proc/base.c
+++ b/fs/proc/base.c
@@ -1099,7 +1099,8 @@ static int __set_oom_adj(struct file *file, int oom_adj, bool legacy)
 	mutex_lock(&oom_adj_mutex);
 	if (legacy) {
 		if (oom_adj < task->signal->oom_score_adj &&
-				!capable(CAP_SYS_RESOURCE)) {
+				(!file_ns_capable(file, &init_user_ns, CAP_SYS_RESOURCE) ||
+				 !capable(CAP_SYS_RESOURCE))) {
 			err = -EACCES;
 			goto err_unlock;
 		}
@@ -1112,7 +1113,8 @@ static int __set_oom_adj(struct file *file, int oom_adj, bool legacy)
 			  task_pid_nr(task));
 	} else {
 		if ((short)oom_adj < task->signal->oom_score_adj_min &&
-				!capable(CAP_SYS_RESOURCE)) {
+				(!file_ns_capable(file, &init_user_ns, CAP_SYS_RESOURCE) ||
+				 !capable(CAP_SYS_RESOURCE))) {
 			err = -EACCES;
 			goto err_unlock;
 		}

base-commit: 9437046953b2fb3bf55b36582450ea0267df82a7
-- 
2.43.0

