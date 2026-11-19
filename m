Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795064546;
	b=yiaaACxgQCVUDe11mjJgBE5t/kzoVJ9u53LM/cB3EvsPtfn2ec0RhAa8QL1Q28f+he+w
	 lPP0D9wr6ecgVms+JrD8knOqULR6YnsbbpTuKdUBiTPKgDAsfmg3rDB8gxYKoERkse+Dc
	 5R/DDcJ91O5xQ7p9LjW0cH59e+f+uKZb4uxCd/bv4qufuehX9YKF5hv8O7v66DMrFWpuu
	 3K4UUYCF4q7vdGjaD6hyPtgO9UhocF7o62zynL64jbMrVOtFXyL6c5VSyLDgo4LuXMy4B
	 WXaNJe+DIQKJ4U9P3UNvawCD2TAFr9ljSZuWsl68lo1QJUgJRWFKrKU2b0IFBEXE5fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795064546;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=gMHu40HPB2BKy7MquzF3lmOkVTKUayEImgeIr9c7qLA=;
	b=q498WWOwv9GTYo9ZlhOhntI+TLdAIBk008pptveiGQA6/hrWZZIXPq4hPhf8bmNfYiH8
	 6GHMBK0RyCIM5hBRjGdmFpyOjEKyN+c+2sSw5lUPPUqWRyctZo+/quvml/3WkK/sQuy2Z
	 r+Nbne0iuusQv4tUc9Z91yd8MOZxeNcX/8guRZfssXDn5JClLO9rkpbc9xZ5uyZmg0sUi
	 jQsHb8O1lan6WtEXmVyBLvDu3z0BiAyue0+TSUj4ap6U6n8obHe+Bj6mF7ofjwCKcengD
	 khRDmt3UMJvKEIzemyIn0q/0xDhOmppH7gCyMr774ksBGijPsqQDfT0cizog3gW7SBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=I8VeSSrv;
	arc=none smtp.remote-ip=117.135.210.2
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1799606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 05:02:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1799606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=I8VeSSrv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=gM
	Hu40HPB2BKy7MquzF3lmOkVTKUayEImgeIr9c7qLA=; b=I8VeSSrv/NomH3j4d7
	hc20yi8TVjYVNmVTJlakLrWEcPlrdgNAwMR3umALxhMMwYNRsm/RzwWCjgbRBOes
	yM+Tp8n62ujI5NGAH65LnisjHUUIE6iHStSyShEKT7Wj9LsjvnPyTSCistxGR5jP
	j2stBUFYbIhHpbTqMf7DctoAw=
Received: from 5219-2604 (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wD3_1CEgv5qfDulIg--.27439S2;
	Thu, 19 Nov 2026 13:00:55 +0800 (CST)
From: Xionggui Chen <evers_chen@163.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Xionggui Chen <chenxionggui@lanxincomputing.com>,
	Paul Walmsley <pjw@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jisheng Zhang <jszhang@kernel.org>,
	"David Hildenbrand (Arm)" <david@kernel.org>,
	Vivian Wang <wangruikang@iscas.ac.cn>,
	Muchun Song <muchun.song@linux.dev>,
	"Guo Ren (Alibaba DAMO Academy)" <guoren@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.dev>,
	Nam Cao <namcao@linutronix.de>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: mm: Disable GCOV instrumentation in set_satp_mode()
Date: Thu, 19 Nov 2026 05:00:41 +0000
Message-ID: <20261119050049.174124-1-evers_chen@163.com>
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
X-CM-TRANSID:_____wD3_1CEgv5qfDulIg--.27439S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Aw1fXFy7GF1DuFWDWFy5twb_yoW8CFWxpF
	WrCan3G3yUXrykKFn7Cry8XrW7J3Z5KrW3CrWDt34kWw4qyFyrta1ayw1Yv34DWrWxZa4r
	WayYgry3uFWDA3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07Uq38OUUUUU=
X-CM-SenderInfo: xhyh22pbfkv0i6rwjhhfrp/xtbC6wccJmr+goc2rQAA3c

From: Xionggui Chen <chenxionggui@lanxincomputing.com>

When CONFIG_GCOV_PROFILE_ALL is enabled, GCC instruments
set_satp_mode() with GCOV counter updates.

The function temporarily enables an identity mapping to probe
supported SATP modes. GCOV instrumentation may access counters
outside this temporary mapping while SATP is enabled, causing
a Store/AMO page fault during early boot.

On QEMU virt with Linux 7.4.0-rc1, the fault occurs immediately
after writing satp. The faulting instruction is an amoadd.d
updating a GCOV counter in set_satp_mode().

Mark set_satp_mode() with __no_profile to prevent GCOV counter
accesses during SATP probing, while preserving GCOV coverage
for the other functions in init.c.

Without this change, QEMU fails during early boot. With this
change, the kernel reaches root filesystem mounting.

The fix was also verified on RISC-V hardware with Linux 7.2.0.

Signed-off-by: Xionggui Chen <chenxionggui@lanxincomputing.com>
---
 arch/riscv/mm/init.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 070ee69eabb3..f1c778a82157 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -833,8 +833,11 @@ static bool __init is_vaddr_valid(unsigned long va)
  * The maximum SATP mode is limited by both the command line and the "mmu-type"
  * property in the device tree, since some platforms may hang if an unsupported
  * SATP mode is attempted.
+ *
+ * GCOV instrumentation must be disabled because the temporary identity
+ * mapping does not cover GCOV counters while probing SATP modes.
  */
-static __init void set_satp_mode(uintptr_t dtb_pa)
+static __init __no_profile void set_satp_mode(uintptr_t dtb_pa)
 {
 	u64 identity_satp, hw_satp;
 	uintptr_t set_satp_mode_pmd = ((unsigned long)set_satp_mode) & PMD_MASK;
-- 
2.53.0

