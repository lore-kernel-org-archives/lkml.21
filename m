Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.226.251.25
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795016114;
	b=2jZtfsjCi7pbWqdVNIGi4P+CRKxW2jyMI+lBa0oIPR/V8oo426P7+HGzIN4auHHRxZBj
	 vyR6lq4D1h11ptvQ0jXUsrM+/MPWW0hjlVHN3m0wpLWii6T6zYywwTNmE0Oek57zcfsPj
	 +5VesAP+rQNN4TGr00fUSduING/ra7kZ3ufV5Vppt/rj42S30EoE16GDr5cDK7LORKaQL
	 88vPG62GY4w4dNwNFREAIDX8zfBd9Adg+Yr5hM353QTAVxXmrz3sSkYxJ+rvraFFm6NSm
	 pBi9uU52T6TpJZ5HePgrCZKeDqw2WhPgE4Oiah2cgqLSUSHKsTFSRqJMjs0/QdTVjgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795016114;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=s7r+01udPUbFSSIG37iPb9ME5s8rSJBrKeCh4/D6PmU=;
	b=XP8awDOqMlS84iaWMFWKlrAnnMpm3VWFZDaJN7XbHnC0++Zh2XbcThaQibw7UNvIDqrB
	 96+hqW+OjPcdeDKqeKBViQYwB22lSJ9FJ3Wg4zQQ+Z8CeB299wzbJ3jyZyNb/Hw3SgiId
	 COBDSaJDcoA+ELXzrbUrwOVX6QRzRyEU3btOvNXjfTAE5H8NBlP8jVWSMQFtz+EMpxp10
	 mkZiwHz456a3Mdb48xuQjaD+/U0N9qcmi21khmTwzrGiG0H5VlvnC4gkdnV9QAOXNIHLa
	 yRHXAZCdlIxtM+p+ibmzDcpkLc9WFvxPO2CKyb8+5C6om7Bu2hGc3UI8sd7zsZyxM3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iscas.ac.cn;
	spf=pass smtp.mailfrom=iscas.ac.cn;
	arc=none smtp.remote-ip=159.226.251.25
Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3082A606A33D
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 15:35:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3082A606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.102.23])
	by APP-05 (Coremail) with SMTP id zQCowAB31bqdxf1qc3xpAQ--.6681S2;
	Wed, 18 Nov 2026 23:34:54 +0800 (CST)
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Simona Vetter <simona@ffwll.ch>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Joey Lu <a0987203069@gmail.com>,
	Han Gao <gaohan@iscas.ac.cn>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Icenowy Zheng <uwu@icenowy.me>
Cc: David Airlie <airlied@gmail.com>,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: [PATCH v3 0/5] drm/verisilicon: misc fixes
Date: Wed, 18 Nov 2026 23:34:43 +0800
Message-ID: <20261118153448.375639-1-zhengxingda@iscas.ac.cn>
X-Mailer: git-send-email 2.56.0
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
X-CM-TRANSID:zQCowAB31bqdxf1qc3xpAQ--.6681S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Cr4xZw13Kr4UCryfGFWrGrg_yoW8JFW8pr
	43tFZ0yF4DXFWaqasrJw48t3yfAFs7tayIgr1xKr18Zwn0yw4UXr18KryfWFWDXrZ7Gw1f
	trs2krW7uryIy3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9j14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxa
	n2IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4
	AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE
	17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMI
	IF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4l
	IxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvf
	C2KfnxnUUI43ZEXa7VUbGQ6JUUUUU==
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/

This patchset fixes several problems. The first one fixes a bug when the
firmware did a modeset with different mode than the one picked by Linux,
and others are fixing problems pointed by Sashiko.

During the reviewing process of previous revisions of this patchset, I
found that the atomic_enable/atomic_disable hooks are not suitable
because of poor off-screen plane process, so I dropped both hooks and
let atomic_update handle everything now.

Changes in v3:
- Remove atomic_disable along with atomic_enable.

Changes in v2:
- Reworked the fix for atomic_disable NULL dereference.
- Fixed the problem that clearing FB_EN would prevent showing
  bound-but-invisible planes.

Icenowy Zheng (4):
  drm/verisilicon: disable the output before enabling it
  drm/verisilicon: nuke planes' atomic_enable hooks
  drm/verisilicon: check old state CRTC in plane atomic_disable
  drm/verisilicon: nuke planes' atomic_disable hooks

Joey Lu (1):
  drm/verisilicon: fix DC8200 primary plane disable clearing FB_EN

 drivers/gpu/drm/verisilicon/vs_bridge.c       |  8 ++++
 drivers/gpu/drm/verisilicon/vs_cursor_plane.c | 40 +++++++---------
 .../gpu/drm/verisilicon/vs_primary_plane.c    | 48 ++++++++-----------
 3 files changed, 44 insertions(+), 52 deletions(-)

-- 
2.56.0

