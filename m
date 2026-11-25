Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.240.27.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795595205;
	b=YSoggfxNLNscPvxudsQdM293BQ5vHuoo5MaDN6Zey6LNbov69FFPhiCMVyAHhk5uxHdZ
	 FT07UhQncN+XrCs+qj4MP+2myyly5fyhZJqvYnr0zUM1rapaQVvnicyMynvWRSXLAOIJ+
	 VLdeXgKx7JHE/EfSZBooR5AV7yrh7j7hQPYuApynuuElb24kOJgjyfLl3RRMZiqkucTAv
	 StqpgH7juP9NLuz9BjoioF/Aa2fVJlqm7gEQ3v0Rh2vXfLEjKYk02Ueu1ycs7dmpfNprR
	 SYR9upejI73v/ejWNCu/Ob8kN76D9plfWhPJkXiJIFsj4qomdzpEXJSnd1ws5yRn3cA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795595205;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 X-Virus-Scanned:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Feedback-ID:
	 X-SES-Outgoing;
	bh=UOyc68vA6BEakrLuic9uR2R1xZi5FE3xdpAVEWeeyKM=;
	b=Av9MapQKFynvwC20II7bK8WMLL7+yRan8Bec/Cr3D6/c/oCMKZ/9hU4eWAr7+eYkDO+7
	 ysq03YsNfN6j09EPbOPZ8PJc65rM8DdZb4raXnHya1/mIYKKhw/+CeoSLAst88NTuSF1r
	 SH3B0MEv7MO6t3+t6sLlk5iGt8leG36IGbseu8vSdBGBuO13+e7zZEeFXSyVFmWPFtSlb
	 MX6QlUG1lPAgL9zjUSGWky6/7LpJzXhiPQAWfsY5f4IMLMs5j3U32WX6r80YIFQMh27hh
	 +kox5dprlnRp8SrUAh6A6mWFxsvVJS1cBcVl6bgyrpEktXXd2wMoUZtlbgGaJOt67Tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=retsim.com;
	spf=pass smtp.mailfrom=us-west-2.amazonses.com;
	dkim=pass header.d=retsim.com header.i=@retsim.com header.a=rsa-sha256 header.s=abaygg6onarqet2uti4t4yyiczbpngnf header.b=0zeNhUQ1;
	dkim=pass header.d=amazonses.com header.i=@amazonses.com header.a=rsa-sha256 header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b="DvQ8w/45";
	dkim=temperror header.d=retsim.com header.i=@retsim.com header.a=rsa-sha256 header.s=dkim header.b=VyWiak+B;
	arc=none smtp.remote-ip=54.240.27.116
Received: from a27-116.smtp-out.us-west-2.amazonses.com (a27-116.smtp-out.us-west-2.amazonses.com [54.240.27.116])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D15D606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:26:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D15D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=retsim.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=us-west-2.amazonses.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=retsim.com header.i=@retsim.com header.a=rsa-sha256 header.s=abaygg6onarqet2uti4t4yyiczbpngnf header.b=0zeNhUQ1;
	dkim=pass (1024-bit key, unprotected) header.d=amazonses.com header.i=@amazonses.com header.a=rsa-sha256 header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=DvQ8w/45;
	dkim=temperror header.d=retsim.com header.i=@retsim.com header.a=rsa-sha256 header.s=dkim header.b=VyWiak+B
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=abaygg6onarqet2uti4t4yyiczbpngnf; d=retsim.com; t=1795595204;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=qsGFfntf6lM+OdsemqqtNR29nCSCQOpdhIf05lfqyx8=;
	b=0zeNhUQ1EiGw8qJZ25K10IVq8qWUCJ/isVu/1RorX1FuGpjMchUbLK0El1TsvfZT
	SBKUO1IwZOY9fvMUfFXvCMjbbc6cxDUYYDsZfgsoh7b5MhKuCwqgfBX2SgE9zvZ0vin
	Dh0JhcikqtEGMvPTuR/8LbfE2uEF+7Z5OLB9rOuE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1795595204;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Feedback-ID;
	bh=qsGFfntf6lM+OdsemqqtNR29nCSCQOpdhIf05lfqyx8=;
	b=DvQ8w/45i35SNcQUENKsBcju11mV1XOKFa0kvZOvV3xlRwZq+/dNWTVwmMmWiV4/
	3LgVs1eVVeKI/zX5EuoJTetDON/sHHrRBGAiFHXvUlytABhFoKmUqw1By5c4N7ZwcQl
	WTX3NUfb4deWnu5WEXcemsv08eNB5RI+Gi6eVhrk=
Authentication-Results: mailserver.retsim.com (amavis); dkim=pass
 reason="pass (just generated, assumed good)" header.d=retsim.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=retsim.com; h=
	content-transfer-encoding:content-type:mime-version:x-mailer
	:message-id:date:subject:to:from; s=dkim; t=1795595197; x=
	1798187198; bh=qsGFfntf6lM+OdsemqqtNR29nCSCQOpdhIf05lfqyx8=; b=V
	yWiak+BtiyYaFf55DS0Q/YozqJhel0pipO673sj1sQ3lFphWoGjDoro+9osFbxei
	Vp/hIMzs+0kbjlBxaGlM4pmLWTI4Lm9sesGBkVfuSXHszZUcmRyjEqjSzZe2Px16
	92IaM/yCkqK+DUpWZTQ2OTbvFj6z8hXZs7CvWM3Hwn7FwGRVUe+eoPrJKnGXj66M
	/ppYegYoj0iEX+9TymACbdTlWLAmzYszwknqw/ZCealMKvv7dYs7+evpXsbGNKti
	axUZgj03hpK5whFKZpztmWkCaZ5Sl/HRXsLfkUmUb/QRDi6LpSBVX/TRPY1acCp7
	ouKjoHhNgDOyL3mb1U6kg==
X-Virus-Scanned: Debian amavis at 
From: Lewis Lakerink <lewis@retsim.com>
To: imagination@lists.freedesktop.org
Cc: Alessio Belle <alessio.belle@imgtec.com>, 
	Luigi Santivetti <luigi.santivetti@imgtec.com>, 
	Ryan Brue <ryanbrue.dev@gmail.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Lewis Lakerink <lewis@retsim.com>
Subject: [PATCH 0/2] drm/imagination: fix teardown use-after-free after removal
Date: Wed, 25 Nov 2026 08:26:44 +0000
Message-ID: <010101a211d07799-e2fbeacd-595a-4f44-b860-29ed38ed8a40-000000@us-west-2.amazonses.com>
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
Content-Transfer-Encoding: quoted-printable
Feedback-ID: ::1.us-west-2.jZ+gdeR9TqNTaB6Dq50UPG8S0IjuYZETsFsi7SlhF6Q=:AmazonSES
X-SES-Outgoing: 2026.11.25-54.240.27.116

Hi all,

These two patches fix use-after-free crashes when DRM files, syncobj
fences, or in-flight jobs outlive the PowerVR platform device:

  1. drm/imagination: guard fence release against device removal (13+/1-)
  2. drm/imagination: quiesce queues before device teardown (135+/6-)

pvr_remove() currently calls pvr_device_fini() and
pvr_queue_device_fini() before drm_dev_unplug(), and leaves scheduler
workers and timers running.  Unbinding the device while a client holds
an open DRM file or syncobj crashes on fd close in __queue_work() on
the destroyed sched_wq (from both drm_syncobj_release() and
pvr_queue_kill()) and in pvr_meta_vm_unmap() on the freed
kernel_vm_ctx.

Patch 1 guards pvr_queue_fence_release() with drm_dev_enter().  Patch 2
depends on patch 1 for <drm/drm_drv.h> in pvr_queue.c (the series
applies cleanly with plain git am), stops the watchdog and calls
drm_dev_unplug() first when !READ_ONCE(pvr_dev->lost), quiesces active
and idle queues via drm_sched_entity_fini() + drm_sched_fini(), guards
postclose/destroy_context/timedout_job, and flushes sched_wq before
device teardown.  Device objects on files or fences that outlive
removal are deliberately leaked (reported by the existing WARN_ON()
checks) rather than reworked around drmm_/refcounted device lifetime
here so the fixes remain backportable.

Overlap with pending work:
Ryan Brue's unmerged system-suspend series ("[PATCH v3 0/4]
drm/imagination: fix system suspend, and the callback design underneath
it") also moves pvr_watchdog_fini() and drm_dev_unplug() (guarded by
!pvr_dev->lost) earlier in pvr_remove() (patches 2/4 and 3/4).  This
series leaves pvr_power.c untouched so it applies cleanly on
drm-misc-next independently of the system-sleep rework; happy to rebase
onto v4 of that series if maintainers prefer to land it first.

Tested on MediaTek MT8173 (PowerVR Rogue GX6250, arm64) on v7.3.6 with
a Vulkan client and sysfs unbind across close-only, idle unbind, 6
in-flight unbind/rebind cycles (3 runs across explicit close and
SIGKILL), and module unload (rmmod): 0 oopses/faults, with the expected
leaked-object WARN_ONs.  (An earlier revision without the !lost guard
also passed a 75 s post-unbind hold past SCHED_TIMEOUT_PERIOD.)

Known limits:
- Compiled (arm64 defconfig, powervr.ko) on drm-misc-next (a2853fd);
  runtime-tested on v7.3.6 (arm64, MT8173) only.
- Runtime PM on remove is left untouched (see patch 2): a
  runtime-active GPU remains powered after removal.
- Foreign fences outliving both removal and the last drm_file close, and
  unpopped entity jobs blocked on external fences (deferred to system_wq
  by drm_sched_entity_kill()), still require a full device-lifetime
  rework.

Stable notes:
- Patch 1 (Cc: stable # 6.14+) also affects 6.12.y, which carries
  df1a1ed5e1bd by backport.
- Patch 2 (Cc: stable # 6.8+) tracks bug provenance; pre-7.x branches
  need backport adjustments in pvr_queue_timedout_job() and pre-6.12
  postclose.

Disclosure: analysis and patches were drafted with an LLM coding
assistant (Assisted-by: LLM on both patches; no sparse, smatch, or
coccinelle pass was run).  I reviewed the changes and ran the hardware
builds and tests.

Signed-off-by: Lewis Lakerink <lewis@retsim.com>

Lewis Lakerink (2):
  drm/imagination: guard fence release against device removal
  drm/imagination: quiesce queues before device teardown

 drivers/gpu/drm/imagination/pvr_drv.c   | 73 ++++++++++++++++++++--
 drivers/gpu/drm/imagination/pvr_queue.c | 80 ++++++++++++++++++++++++-
 drivers/gpu/drm/imagination/pvr_queue.h |  2 +
 3 files changed, 148 insertions(+), 7 deletions(-)

--=20
2.43.0
