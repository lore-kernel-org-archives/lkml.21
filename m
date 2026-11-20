Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.196
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795164708;
	b=RW8OJakBKa2IZfNQJsWT/vatI/Pahdpm0WJLvYF6OPY2PHPbLwl+dor2wf6qPRe8/Sje
	 7JBUA/KfCyXQaOfeOwaA3MCRKD8oN1PsFnOJ0XfjYHB+quVQ9y9MgQnfLvWXt76PI8MIi
	 LoAhS3wKIPywNKu+cQu0C7iMvDMKA3+Y4v0a6doNJ9reZs1N9Jocb/MMT37n+q68PwXeT
	 PKXzT/FjljzxGBQKhRJndpwul3koT/BGLakb/+5aMuveBV24YxIgwOWhEEW1k0HHf4ZkU
	 vANLADf53ZwInyKJ/ugVuEY5kzcGEY/x3fyq7utgjlKa/UDuZf2dBzOF1xdfE1wEqWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795164708;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=KKdx234HIc0ImmFL6/W/0CUujjCP+++uYg5Sa1Vuj70=;
	b=0H0Capoa092VT/GPlKpgc1FiAUdf0mVIJIsvOIu4H/luCrip1rCvGsklWBVZ9WSm3zs7
	 Jqrks0vyeDbwL8cB8mE6CBS68IrD9y4Qqikxc2LkkCwiWhCEYKwIZg7ek4dbO6loVG8oa
	 L4F3ClqorsOlPQFvlLl7BHE5ChJiRlyGce7ivMbuzLwl4xZdFNf2Hx5QqPGxTjH39Ptrn
	 5dllEIRcMxIeC0MGXhqGkz8pmxFfqsFSIs6oVfaT7dQoq1EVM43WQno7k4EN1wqWMJiJS
	 PzfxKDnjzbp/wtCoyiaixVFE/+WtkgGBQL3ke6YnrNW2UpQ7zH11pPe7v7ucVB2DDNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="GsxEN/3F";
	arc=none smtp.remote-ip=74.125.82.196
Received: from mail-dy1-f196.google.com (mail-dy1-f196.google.com [74.125.82.196])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3CCF606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:51:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3CCF606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GsxEN/3F
Received: by mail-dy1-f196.google.com with SMTP id 5a478bee46e88-38564b4b017so670772eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 00:51:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795164707; x=1795769507; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KKdx234HIc0ImmFL6/W/0CUujjCP+++uYg5Sa1Vuj70=;
        b=GsxEN/3FGlHyHllEDootP16iud5WiCrZc73xDVDAHfJkuu05N65EVXrykG1lW3GaW0
         qvcJYJ5ND7nDAWsyDu5U/34h0PGvGS0UaTrccNRYGm2yIb86vN3SO1Nw5EH94n3WeuAm
         OFfxY9Y9So+11iDr0O9jhFezi/7BhsAmACc9fB9S5q+TFy57ptCl9tH1YCrheKUm1oks
         AhpXvfkUX3T2ewVmHBw9Cy6SkMkpsK0scXtCbsoEUqeOb2a2/K976S++NDcOAE24tXJk
         OTBow42b0GbQfzb/rBEWIrPCtFxz71d9ZIZ6rn0cl8Y0ZWuqQCv2XDkwBc9Oxr+F2K26
         Ki1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795164707; x=1795769507;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KKdx234HIc0ImmFL6/W/0CUujjCP+++uYg5Sa1Vuj70=;
        b=ERHTj5n1qBbk2w9jrJMXmvNG1sa0+lnkuoPvuwXv7o5pCadycPLfQyc0n0f911MN6C
         c3vVujD7If5UNgArLnxjysLTwxCS9jQOmmbIyBSCO6v3MmkPIr5IjKemvQE48WVTIQll
         Dh17bOW1AED+GzOkdniF6RuOXV0dDxgGDcpWe3hm7kRomgB6eNKSyElPv3dcvcvsqFf7
         1ALRyhTcHirJ0WypwIvyQ77ExSrxHpfvlcxClolkCEPxdN3AxHqiG74f3AGbt4alzVb/
         ER45YFwu07LOAeNivevBwpU6/GYjsOXKVxkbwUkrNO0Yrn1UXJ6ucvMmlygALqR+IkKr
         Df5g==
X-Forwarded-Encrypted: i=1; AL+hErHcQyo3k0NJ29OVD0OryOAJ3ng0HSURrqITYglRVo8yJvyLbq7vcj6ceuA8BCBMAwIpcO5M1cnQMJn5yHw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9QJ4v8OHLlAOOycH4SPMKmTRRgYEu6XKBytd49UnGTU3uNBuH1
	8XOyqADLbEOh/97S9H+ZtfHQCmO6ZbE4uOY5D0Kqtep+K8LzegYNjn2D
X-Gm-Gg: AZFdTZceJckb3eqZyPq8RwEBe1q/yZqBGWnEDGW+wCLFtk2nmvU0zGjtMLwByK8sxMs
	+LtIwzaCJi6yh8qHRHYqyDl2UqPmMwyqKgK5sI7cexOi49x+xW5Jzn8bHHG37mOuqB4uwqo0L9J
	gFXhk52CDryP247l7+hIBi6qthgR+QnWvsoHKHuOLv7VcjUusklqupmfoUMo68l4qpc2Ogb/Du7
	zqWraSn+3B7lLhw21UGOaTlkod9bIjF9YnOYmnxBI2+0z2ls6Meb9O8futJEMwq/ZPP9/OAhqrh
	UtLKbUc3cnldSzaQM9TPu+6HY9wxvYKmwmY61fsEdfnC7eKuQAi2SkJ9jGeMBza1pL+g2zPQIvB
	dxAjK2zdpF+OK00FcdMQfxmusjg08UrVFY3pHF4xkVJgovcqVXi6fbt1yJ0PKLwEQhuucfn0NgV
	nhjnPKg2I88E8OgTaYGX+G6wJ5HKCo4ywTgzjhIxa18chiukm/E2FEICQroiZyZ+jn3UIh+Ihvu
	9n1gnB1SWXoTs4quwGYvrlIy5vB+mh1G4SRbEo8ZtMiGGDox2xVIoyHwIE58TVcOdrxGuwYBW9S
	UmudJlGTE1yhcQ+V3AKSL1yb/4W4l9xQTqtE30LBNkFRUjG2oCEQxDPF1dqnN1wVgOuUfiOxiGm
	ais5bis8XXIIFWjO6xTQaXGj6aUwKNw42H0JaqA==
X-Received: by 2002:a05:7300:fb07:b0:36d:158c:e31d with SMTP id 5a478bee46e88-384b446d603mr3319103eec.18.1795164706953;
        Fri, 20 Nov 2026 00:51:46 -0800 (PST)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385f68bc0adsm3495445eec.13.2026.11.20.00.51.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 00:51:46 -0800 (PST)
From: Hungyu Lin <dennylin0707@gmail.com>
To: hannes@cmpxchg.org
Cc: surenb@google.com,
	peterz@infradead.org,
	mingo@redhat.com,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	kprateek.nayak@amd.com,
	cerasuolodomenico@gmail.com,
	mic@digikod.net,
	gnoack3000@gmail.com,
	didtldms2525@jnu.ac.kr,
	linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dennylin0707@gmail.com
Subject: [PATCH v2] sched/psi: Check CAP_SYS_RESOURCE in the initial user namespace
Date: Fri, 20 Nov 2026 08:51:18 +0000
Message-ID: <20261120085135.40368-1-dennylin0707@gmail.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Commit d82caa273565 ("sched/psi: Allow unprivileged polling of N*2s
period") moved the CAP_SYS_RESOURCE check for psi triggers from the
open() of the /proc/pressure files to psi_trigger_create(), so that the
credentials of the opener decide whether a trigger is privileged. In
doing so it replaced capable(CAP_SYS_RESOURCE) with a direct test of the
opener's effective capability set:

	privileged = cap_raised(file->f_cred->cap_effective, CAP_SYS_RESOURCE);

Unlike capable(), cap_raised() does not check against the initial user
namespace and does not go through the LSM capable hook. A task that
creates a user namespace has a full effective set inside it, so an
unprivileged user gets privileged triggers on /proc/pressure/* and on
delegated cgroup pressure files: windows that are not a multiple of 2s,
served by the SCHED_FIFO psimon kthread, which the N*2s rule was meant
to keep from unprivileged users. LSM policies that deny CAP_SYS_RESOURCE
are not consulted either.

Use file_ns_capable(), which checks the opener's credentials against the
given user namespace through security_capable(). This brings back the
user namespace and LSM checks of the capable() call it replaced.

Fixes: d82caa273565 ("sched/psi: Allow unprivileged polling of N*2s period")
Reported-by: Sieun Yang <didtldms2525@jnu.ac.kr>
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
Tested-by: Sieun Yang <didtldms2525@jnu.ac.kr>
Tested-by: Mickaël Salaün <mic@digikod.net>
Reviewed-by: Mickaël Salaün <mic@digikod.net>
Cc: stable@vger.kernel.org
---
v2: Collect Reported-by, Tested-by and Reviewed-by tags; no code change.
v1: https://lore.kernel.org/all/20261106120004.90041-1-dennylin0707@gmail.com/

 kernel/sched/psi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/sched/psi.c b/kernel/sched/psi.c
index 7c5381423334..cf2593183b25 100644
--- a/kernel/sched/psi.c
+++ b/kernel/sched/psi.c
@@ -1347,7 +1347,7 @@ struct psi_trigger *psi_trigger_create(struct psi_group *group, char *buf,
 	 * Checking the privilege here on file->f_cred implies that a privileged user
 	 * could open the file and delegate the write to an unprivileged one.
 	 */
-	privileged = cap_raised(file->f_cred->cap_effective, CAP_SYS_RESOURCE);
+	privileged = file_ns_capable(file, &init_user_ns, CAP_SYS_RESOURCE);

 	if (sscanf(buf, "some %u %u", &threshold_us, &window_us) == 2)
 		state = PSI_IO_SOME + res * 2;
--
2.43.0
