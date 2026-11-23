Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795431838;
	b=R4AL5bDm7nOEPbiodSfGE9/17hUntEkjNRuMHVZoEr8p8VzSUP8nDFT+9CAKQoooIK80
	 PywBcwiEkZY+vT81K3c9CReAIND88pLB9HmL6Ph/wtZRqFW8pyURCTtkCN+MMaSYDeoIk
	 T5cyw+IhlvYowt8QmYZi2vNO89G0KegQGyqEQxkhjUrjH0GKUQNFThJCqaLUaLcKyoWB3
	 DCwUeTezDMWpP0x4sntRYU3suAruGlHocpSoo72yViAbuUE32Ry+mPISG5gzhEUk5yoBp
	 1IE/g5xDFGqaNsM1gjnC3QJT/FcAr99ea/BYPTNCdaWC1PhdPDayh5VDCBz7hf7Yq2g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795431838;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=S23ZLX2KEU86gBUAwKA4pr9N6R5ElnEsSeiEDZ5cPMg=;
	b=ChJvec8H5JfmFTJz96G93U71n4hLY6EOV5IqNt68ymLp+oVRNHA/Wywcnb32uPwq7G63
	 wMDYBZz66rezLuwgo1LA/IFRAwXsY7wBv2xQG0grkSNjKFLX1yu/YeyMwhQ9cdrjOBeq0
	 koNF9L3IlI46+YoRiafiWhnHrSQFRpZVzlj1YC/q/6s2vJ0KQqi4Lxgc77J6E8QXwrhj7
	 PeiBu6Gjve+LlWACmNssuDN19Gco8hwq+nTvTi3ajpSTf28JLldPfgvHgUrJB0X03kjzh
	 /W+pnZ08tlPXl3/xslFmvb+ua+dw/XsFJwmVcPExjv9JAzP0V92xfNImXAp4h/UQ3wA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="ie/VY50y";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C4F7606A683
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ie/VY50y
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795431838;
	b=TU9wGs5H0GjHcbCV9lZC4pt9JnzeJF00FYJyHN7ZtTAzH100OeIfEGe8Bnl6H7i4gfT1
	 ur/jkVtJMmFNxFAUXlTRDL3TwC2/abRY6YULXb7E/x/s5W7O28mpJwSwTDYtsTfYBy5Ii
	 kTwkz8lQjOrtich18M3OYtjcXtwut0BO4jLBpueUD7Sr6J1nhchy8Uch45l5c099ijW11
	 KXxOVGgLdlsqQqUvZ1F7SxT3BX8GbTXBXYJmRsaFR1p6sHwTy1xthTOGqoqvKue34qndO
	 2NOzIev7rE99lTz3Srz/tfmPEpIVNwfoUf7yFdA1fvcC3qfhp7q6WR3SJPrfSTofquA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795431838;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=S23ZLX2KEU86gBUAwKA4pr9N6R5ElnEsSeiEDZ5cPMg=;
	b=tQMO4EoVE2wmBSc8KpAtUMf+16KWiOXOtDBWZzktjkd9ypFthUyh63L9I72E03isDpx/
	 VqYwks4Equ/l5CgXeVl3o/AwYGLXPz6IJWSlY6FeZwphdkoWhEM0LDyW6AD3tZphgsakC
	 Oeqn2GojmPN+s0CRX2wA3XTvevhBVpeX7/CqGT+znoJGBz+nCeeIueoLxa/unQkRmkqYp
	 wrvXXIsTy4jMlLd8t0plf+jdZo0fJEQd3059vpyHpzqtvkeYxzwuOVTjikf6DAsNHstCE
	 X2FS00KAlcLe/oZp8ug78SDnyU0Jn2jxFihe7vDPn8qicUtJmwm4k2sduztvczAbjhA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7CF381F000C4;
	Mon, 23 Nov 2026 11:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795431837;
	bh=S23ZLX2KEU86gBUAwKA4pr9N6R5ElnEsSeiEDZ5cPMg=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=ie/VY50yitZHMUdIibUeGcLX6VKWxiXzi1mPOuwIXj7cIS/Ew4NQRx6kFpMkbcRvB
	 R7wLNiN73sanhj3CYUuq1EiN1OuZnzmlwPDnklIF5AKLV2qfXaatlpcmvZ8mntzZ96
	 lxkd8PgdxH3RbJT3BbG+RWHu9fxkouBGmm4hcLGAlkxUBm04L23AoQViCwTUsXusOV
	 mtwk/USG25cv/KCMU1AGdIrgGOBWDGRrhX2ffxlIF2XvCAmif9+vJiDyr+3NJtAhd5
	 W/uX9LD5WhQtdcnFyLnK6mi/g31a/0xpPN17dcfxaQyiV9kIxy1jOuH5Jv3GYgojn6
	 mdMZZbeJ+Fh7A==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id D85164C42A;
	Mon, 23 Nov 2026 11:03:46 +0000 (UTC)
From: Ahmed Abdelfattah via B4 Relay <devnull+me.ahmedabdelfattah.dev@kernel.org>
Date: Mon, 23 Nov 2026 13:03:46 +0200
Subject: [PATCH v2] x86/apic: Use the physical address for the local APIC
 resource
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
Message-Id: <20261123-x86-apic-lapic-resource-v2-1-4474a572aaaf@ahmedabdelfattah.dev>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNQQ6DIBREr2JYl0Zoo6Sr3qNx8YFP+Y1VA0hsj
 Hcv2gN0M8lLZuatLGIgjOxWrSxgpkjjUECeKmY8DE/kZAszWctGiLrli2o4TGR4f2TAOM7BIEf
 plAILqmlbVtZTQEfL8fzofhxn/UKT9ru94SmmMXwOdRZ7778lCy64VBavRl+cFngH/0YL2mLvI
 CXwZ4uZddu2fQFRb2fD2wAAAA==
X-Change-ID: 20261107-x86-apic-lapic-resource-e2f88ada8677
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 "Peter Zijlstra (Intel)" <peterz@infradead.org>
Cc: Chao Gao <chao.gao@intel.com>, linux-kernel@vger.kernel.org, 
 Ahmed Abdelfattah <me@ahmedabdelfattah.dev>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795431826; l=3170;
 i=me@ahmedabdelfattah.dev; s=20261106; h=from:subject:message-id;
 bh=p400VXiAp13U+yYuNFSSnKSaZgbslssngT6wil6wIzw=;
 b=2VnWAHyFn4bRSQqUqBq272f3f0aqF0rnYaPnO+bTpi3hzRguU1BCUmjeLyHFKBowiGaApwyQn
 Pin5t8PR8dpC8QTErelHwpZ+rjI/RM/Re9KzHJuZLN4H/ZLE4dKJYBk
X-Developer-Key: i=me@ahmedabdelfattah.dev; a=ed25519;
 pk=DHEHKU4PddrkJ/iYMZpwyyXsFyIQ6ySjTttKLrt9YqI=
X-Endpoint-Received: by B4 Relay for me@ahmedabdelfattah.dev/20261106 with
 auth_id=1438
X-Original-From: Ahmed Abdelfattah <me@ahmedabdelfattah.dev>
Reply-To: me@ahmedabdelfattah.dev
Content-Transfer-Encoding: 7bit

From: Ahmed Abdelfattah <me@ahmedabdelfattah.dev>

Since v6.6 the "Local APIC" entry is missing from /proc/iomem whenever
the kernel maps the xAPIC itself.

lapic_insert_resource() takes the start of the resource from apic_phys,
which used to hold mp_lapic_addr. Commit 81287ad65da5 ("x86/apic:
Sanitize APIC address setup") moved that assignment to
apic_set_fixmap(), where it became the fixmap virtual address:

	apic_phys = apic_mmio_base = APIC_BASE;

Commit 78c32000848c ("x86/apic: Get rid of apic_phys") then replaced
apic_phys with apic_mmio_base, which holds the same value:

  APIC: Mapped APIC to ffffffffff5fc000 (        fee00000)

insert_resource() rejects that range because it lies outside
iomem_resource, and as the return value is not checked, the failure
goes unnoticed.

Without the resource the local APIC page is no longer marked busy. So
apart from the line missing in /proc/iomem, CONFIG_IO_STRICT_DEVMEM
does not stop /dev/mem from mapping the page any more, and in xAPIC
mode the APIC registers can be read and written through it.

Use mp_lapic_addr, which is the address apic_set_fixmap() maps. Keep
the apic_mmio_base check, so the resource is still only added when the
APIC was actually mapped.

Fixes: 81287ad65da5 ("x86/apic: Sanitize APIC address setup")
Signed-off-by: Ahmed Abdelfattah <me@ahmedabdelfattah.dev>
---
This showed up while comparing /proc/iomem with the memory map of a
QEMU guest.

Tested on QEMU q35 with KVM (x86_64_defconfig + kvm_guest.config),
booting with and without nox2apic. Without the patch there is no
"Local APIC" entry in either case; with it both show

  fee00000-fee00fff : Local APIC

For the /dev/mem part I used v7.4-rc3+ (4405c18c95d2) with a
distribution config that has CONFIG_IO_STRICT_DEVMEM=y, and a small
program that maps one page of /dev/mem. Without the patch the page at
0xfee00000 can be mapped. Booted with nox2apic, the APIC version
register reads 0x00050014 through it and a write to the task priority
register is accepted. With the patch the mmap() fails with EPERM in
both boots, as it does for the IOAPIC page.
---
Changes in v2:
- Fixes: now names the commit that made apic_phys a virtual address
  (Chao Gao)
- Say what the missing resource changes for users (Chao Gao)
- Link to v1: https://patch.msgid.link/20261107-x86-apic-lapic-resource-v1-1-28de4cb3fb1e@ahmedabdelfattah.dev
---
 arch/x86/kernel/apic/apic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kernel/apic/apic.c b/arch/x86/kernel/apic/apic.c
index 90025451ace2..17525b5daa0d 100644
--- a/arch/x86/kernel/apic/apic.c
+++ b/arch/x86/kernel/apic/apic.c
@@ -2667,7 +2667,7 @@ static int __init lapic_insert_resource(void)
 		return -1;
 
 	/* Put local APIC into the resource map. */
-	lapic_resource.start = apic_mmio_base;
+	lapic_resource.start = mp_lapic_addr;
 	lapic_resource.end = lapic_resource.start + PAGE_SIZE - 1;
 	insert_resource(&iomem_resource, &lapic_resource);
 

---
base-commit: d48723711bae9b8cdc56719c448ba42fef28cbee
change-id: 20261107-x86-apic-lapic-resource-e2f88ada8677

Best regards,
--  
Ahmed Abdelfattah <me@ahmedabdelfattah.dev>


