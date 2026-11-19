Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=114.242.206.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795068330;
	b=kmw8dse8LKK2dy/4JL1xtWmUNmyfLOLZZLVkXR8xkMnzLDpFOYVc64SkrA76aMuA4LYw
	 jiGPmgHmisgiPmO51vVBSHJUXYfFH2lQ0R6fNhIUW9L8xQLttO1zIy3Nxi+s7NaQh+6v3
	 OAAIk+VB8bax8Efp5FvqKdNOvI/RREBPfMPxUo1zgeb/UBL/eDCGbnr1biPfLPGIXCGae
	 kXwIpQAHjPU94QkEJ0TiLTSxF/DiuXrQRULNKpZM/IshWKCOICveHD4HSbxFwogjfCGum
	 mZOs56PQ51YLwUx+piNyd3Z3ZDwFpW496kbmm+z8ipX/XzxbC3TDXrh9/VQyvy8Ekbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795068330;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-CM-SenderInfo:X-Coremail-Antispam;
	bh=SZ5KpVvkbNWNwwp3ppDqOVWpnPFzf5le8atsuECmXew=;
	b=VMv+ZVy72I4TWMsiDMyTcc/CTdstnA4Gap8Vot8KuJ5wNJvNoDrw5EZ+7Gbq9Ka85Fyz
	 yutTzz43/CbdP1emd0jDsrKaxqFjjgc0jrUhcsjc2D/+H3haREVoQdnw8xEafjgbcOJmg
	 G1bFWT7TKE8bPp7BBLGpsWCYGg/7aJuwazOXiLFBfSvScBMMki5KWkfMj6nkiS/u1tHTe
	 5BK1X8dDBL5BNW9QuPSl4Us+LCE4QQLwuhGeaTfXBnOkhJRjp/NWGafNW1DhINL/2EJgR
	 mVVxPFSAA5vO+nEhZ0eLuRiqrpoF6nUAWNePsrdZBQHpjcbu1bqBhHoeDqGyW6zvJbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=loongson.cn;
	spf=pass smtp.mailfrom=loongson.cn;
	arc=none smtp.remote-ip=114.242.206.163
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92979606A325
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 06:05:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92979606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [123.138.236.242])
	by gateway (Coremail) with SMTP id _____8DxTNKgkf5qgQ0hAA--.29070S3;
	Thu, 19 Nov 2026 14:05:20 +0800 (CST)
Received: from linux.localdomain (unknown [123.138.236.242])
	by front1 (Coremail) with SMTP id qMiowJCxNs2fkf5q18w1AA--.28430S2;
	Thu, 19 Nov 2026 14:05:20 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] LoongArch: Fix preemptible warnings in cacheinfo and local TLB flush
Date: Thu, 19 Nov 2026 14:05:03 +0800
Message-ID: <20261119060503.4114-1-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
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
X-CM-TRANSID:qMiowJCxNs2fkf5q18w1AA--.28430S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxCw4kAryrAry7WF47ArWUAwc_yoWrCr4xpF
	yxuF1ktr4rWa4kK348J3y8XryfJr9Yq3W7tanxAay5Za1YyryDXr93Kas7ZFyUu34rWr4S
	9a9Iqw1Y93WUZFXCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE
	14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jrv_JF1lIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8j-e5UUUUU==

When CONFIG_DEBUG_PREEMPT is enabled on a Non-SMP kernel, calls to
smp_processor_id() (including via current_cpu_data) in preemptible
contexts trigger many "BUG: using smp_processor_id() in preemptible"
warnings during cacheinfo setup and local TLB flushes.

Fix the callers properly:
- Use the passed-in 'cpu' parameter to index cpu_data[cpu] directly
  in init_cache_level() and populate_cache_leaves().
- Replace smp_processor_id() with raw_smp_processor_id() directly
  in local_flush_tlb_{mm, range, page}(), then reuse cpu_data[cpu]
  in local_flush_tlb_range(), because the SMP callers are already
  protected and task migration is impossible on UP.
- Remove the redundant preempt_disable()/preempt_enable() pair in
  local_flush_tlb_mm() for consistency.

This eliminates the warnings on Non-SMP builds without adding extra
overhead.

Fixes: b61a40afca16 ("LoongArch: Refactor cache probe and flush methods")
Fixes: 09cfefb7fa70 ("LoongArch: Add memory management")
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
v2: Use raw_smp_processor_id() instead of get_cpu()/put_cpu() in local
    TLB flush functions.

 arch/loongarch/kernel/cacheinfo.c |  8 ++++----
 arch/loongarch/mm/tlb.c           | 18 ++++++------------
 2 files changed, 10 insertions(+), 16 deletions(-)

diff --git a/arch/loongarch/kernel/cacheinfo.c b/arch/loongarch/kernel/cacheinfo.c
index 8e231b0d2cd6..334d116e4c29 100644
--- a/arch/loongarch/kernel/cacheinfo.c
+++ b/arch/loongarch/kernel/cacheinfo.c
@@ -11,11 +11,11 @@
 
 int init_cache_level(unsigned int cpu)
 {
-	int cache_present = current_cpu_data.cache_leaves_present;
+	int cache_present = cpu_data[cpu].cache_leaves_present;
 	struct cpu_cacheinfo *this_cpu_ci = get_cpu_cacheinfo(cpu);
 
 	this_cpu_ci->num_levels =
-		current_cpu_data.cache_leaves[cache_present - 1].level;
+		cpu_data[cpu].cache_leaves[cache_present - 1].level;
 	this_cpu_ci->num_leaves = cache_present;
 
 	return 0;
@@ -67,10 +67,10 @@ static void cache_cpumap_setup(unsigned int cpu)
 
 int populate_cache_leaves(unsigned int cpu)
 {
-	int i, cache_present = current_cpu_data.cache_leaves_present;
+	int i, cache_present = cpu_data[cpu].cache_leaves_present;
 	struct cpu_cacheinfo *this_cpu_ci = get_cpu_cacheinfo(cpu);
 	struct cacheinfo *this_leaf = this_cpu_ci->info_list;
-	struct cache_desc *cd, *cdesc = current_cpu_data.cache_leaves;
+	struct cache_desc *cd, *cdesc = cpu_data[cpu].cache_leaves;
 
 	for (i = 0; i < cache_present; i++) {
 		cd = cdesc + i;
diff --git a/arch/loongarch/mm/tlb.c b/arch/loongarch/mm/tlb.c
index aaf7d685cc2a..07a6a5e94120 100644
--- a/arch/loongarch/mm/tlb.c
+++ b/arch/loongarch/mm/tlb.c
@@ -40,25 +40,19 @@ EXPORT_SYMBOL(local_flush_tlb_kernel);
  */
 void local_flush_tlb_mm(struct mm_struct *mm)
 {
-	int cpu;
-
-	preempt_disable();
-
-	cpu = smp_processor_id();
+	int cpu = raw_smp_processor_id();
 
 	if (asid_valid(mm, cpu))
 		drop_mmu_context(mm, cpu);
 	else
 		cpumask_clear_cpu(cpu, mm_cpumask(mm));
-
-	preempt_enable();
 }
 
 void local_flush_tlb_range(struct vm_area_struct *vma, unsigned long start,
 	unsigned long end)
 {
 	struct mm_struct *mm = vma->vm_mm;
-	int cpu = smp_processor_id();
+	int cpu = raw_smp_processor_id();
 
 	if (asid_valid(mm, cpu)) {
 		unsigned long size, flags;
@@ -67,9 +61,9 @@ void local_flush_tlb_range(struct vm_area_struct *vma, unsigned long start,
 		start = round_down(start, PAGE_SIZE << 1);
 		end = round_up(end, PAGE_SIZE << 1);
 		size = (end - start) >> (PAGE_SHIFT + 1);
-		if (size <= (current_cpu_data.tlbsizestlbsets ?
-			     current_cpu_data.tlbsize / 8 :
-			     current_cpu_data.tlbsize / 2)) {
+		if (size <= (cpu_data[cpu].tlbsizestlbsets ?
+			     cpu_data[cpu].tlbsize / 8 :
+			     cpu_data[cpu].tlbsize / 2)) {
 			int asid = cpu_asid(cpu, mm);
 
 			while (start < end) {
@@ -112,7 +106,7 @@ void local_flush_tlb_kernel_range(unsigned long start, unsigned long end)
 
 void local_flush_tlb_page(struct vm_area_struct *vma, unsigned long page)
 {
-	int cpu = smp_processor_id();
+	int cpu = raw_smp_processor_id();
 
 	if (asid_valid(vma->vm_mm, cpu)) {
 		int newpid;
-- 
2.42.0

