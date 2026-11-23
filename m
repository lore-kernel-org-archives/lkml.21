Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795413122;
	b=B6eIfRDa/4RolRGzp8hMj4EDj5HlfSBOPtUQjJVepOxzDSgEWNQCpItKIOVpr9qSlqVi
	 XNBc94xotPgPC93GHhw3gvDOnNvToghi4dqmFEKWkkiauzmL0kTJdQYxY37pLIhPB+9aN
	 IQcG/xArcjceOmO1a0fPfVCtndt7DyrrbTkV1rIWOsAiezMAmFQXX2gL72ZpDkMGIRW4j
	 dZEjWTAxeuKbjk9I+pepA5ssSGhqZPq2/C8N9LWSHKf3Qv0FWD3NQTr3JAPS1cs912KcH
	 mfOcW2V24ythV8P0ZhJPl7xv2NBmes++BY8oj1bf9F5SQNXsoNqjiuC/syEEQcWsJow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795413122;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=DsK0EuNffUEDXOYmo8ofwWgoqNSo1CY+qYxqNoTzfBo=;
	b=vKbw1Be+PBEVl8II0XIGyl5F/K76cBWsfZjEWiSN5aiwYAg7/QIl9BeRlvaBt0Pjxm/f
	 A3bXevDsGEZqQFjObGt+29dBk8bScfo4IoIbenEhu7J+hkewV+E4Y7qOjtWF3M8dJctBC
	 wij4dmDLtdGoQrtyuIMA7H3q8wa2O+CtNCXu9/LdNezb7VyiJMkZq6xZBZR924ZviCgMp
	 HoZtIrRPzr96ZtqkvPK5kcytXxv+2hrT5Y1AU3wxDQrVaVrCLBCOvlLsI6ioMJ9VEo16m
	 eCrRQhIMKDub0qCVNGujAxQTro8VFTrRYvlY8U1zpJbnTyoP3XLvWOfEqTp683DgKPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=eSpaTiOJ;
	arc=none smtp.remote-ip=117.135.210.3
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06C23606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 05:51:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06C23606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=eSpaTiOJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Ds
	K0EuNffUEDXOYmo8ofwWgoqNSo1CY+qYxqNoTzfBo=; b=eSpaTiOJmVNVKg0pex
	5mBDcWIRF3hpakeOqSExSvV0XllNfZfg72n7/bWhD5E5B0jW7kR6fFFUp54mwRNH
	8Nck5HJfdq57wJbG1Ty5ggAx1G0/cP91spBDP36lwc/OhWtWy0w5hfbtfIUi1QCz
	8qYHRa1U/fk8cBbZ/rq3bPuMc=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wDnL+Ix1ANrvVl9JA--.60204S2;
	Mon, 23 Nov 2026 13:50:41 +0800 (CST)
From: Xuewen Wang <wangxuewen_ky@163.com>
To: akpm@linux-foundation.org,
	david@fromorbit.com,
	qi.zheng@linux.dev,
	roman.gushchin@linux.dev,
	muchun.song@linux.dev
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Xuewen Wang <wangxuewen@kylinos.cn>
Subject: [PATCH v2] mm: shrinker: stop counting when the seq buffer overflows
Date: Mon, 23 Nov 2026 13:50:20 +0800
Message-Id: <20261123055020.287151-1-wangxuewen_ky@163.com>
X-Mailer: git-send-email 2.25.1
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
X-CM-TRANSID:_____wDnL+Ix1ANrvVl9JA--.60204S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7CFWrCFWxZFyUKF48Zr43Jrb_yoW8uF47pF
	Z8Ga9rta1kZw15Wwsaya1fXa4fZFWFy3y5WFnYv3y5JFWfX3WSqryfGa4YgF48C395J342
	vr45Ka4Uua4UZFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jJxhdUUUUU=
X-CM-SenderInfo: pzdqw5pxhzv0xbn1qiywtou0bp/xtbC7xLcxWsD1DLClQAA39

From: Xuewen Wang <wangxuewen@kylinos.cn>

The shrinker debugfs count file uses single_open(), so all memcg rows
belong to one seq_file record. When the buffer overflows, seq_file grows
it and retries the entire record. Queries for subsequent memcgs in
an overflowing pass cannot contribute to the final output.

Stop the traversal once seq_has_overflowed() is true, using the existing
mem_cgroup_iter_break() path to release the current memcg reference.
Check for pending signals first to preserve the existing -EINTR
priority. Leave the overflow state intact and return zero on overflow
so seq_file can grow the buffer and retry.

Signed-off-by: Xuewen Wang <wangxuewen@kylinos.cn>
---
Changes in v2:
- Move the overflow check after signal_pending(), as suggested by Qi
  Zheng, preserving the original -EINTR priority.

Retested in a single-node KVM guest with 1024 cgroups each caching 16
ordinary files on ext4. Output remained 8865 bytes with three show
attempts. Count callbacks fell from 3075 to 2472 (19.6%). Six fresh
guests per variant each performed 101 full reads with no probes
registered. The median of guest medians fell from 127.8 us to 114.0 us
(10.7%, about 13.7 us per read).

Output matched byte-for-byte across the tested guests. Small reads,
seek-to-zero rereads, populated memcg teardown and signal stress passed.
Separate probe runs had no missed or dropped events. Small/sparse cases
had unchanged callbacks. The 64-cgroup baseline timings were bimodal,
so their apparent timing difference is not attributed to this change.

 mm/shrinker_debug.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/mm/shrinker_debug.c b/mm/shrinker_debug.c
index cafb566301326..eabdb33353a45 100644
--- a/mm/shrinker_debug.c
+++ b/mm/shrinker_debug.c
@@ -84,6 +84,11 @@ static int shrinker_debugfs_count_show(struct seq_file *m, void *v)
 			ret = -EINTR;
 			break;
 		}
+
+		if (seq_has_overflowed(m)) {
+			mem_cgroup_iter_break(NULL, memcg);
+			break;
+		}
 	} while ((memcg = mem_cgroup_iter(NULL, memcg, NULL)) != NULL);
 
 	kfree(count_per_node);

-- 
2.53.0

