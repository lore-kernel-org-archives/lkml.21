Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795061833;
	b=doXbhAVkKBlBfpFmcZwmE979w70OI5Ay+xv/y/CRnAqwtr18BZbK7rhkqbL4VI8oUBSb
	 hsgHayL7kk22IcXDDTSk7vVkyDONI1r8YvJhy3NepTCkGvA4MAFLMxm9+YB2zokwlLxjq
	 qG2SZK2zKunc0XgfiTeqoorvQG2qYMFIFdLiQU0aBXc+VpVP3AcPaYU9FJHsQfoUSjQBQ
	 +FjZyQSPwR1dQgpscpTaK6P5GS802Jm/MOwA3QaJR0PwnybtYPecQ8imOpRRbyttQl6I9
	 fFh5Qd3Ap0efO5d4Cu+pBffRFrcGsbeSUZAFZbpk9MbQFV9WYvMo8GlI6H2jKXWbS1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795061833;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=8EqyXa9InHENTTrj2gvqAPynFFShKveNH2iKhVcGlXs=;
	b=1WcqwxxxWJj+lVPFBb+XvCYLX3T8HSnYHEaeZpRUdulG7Fg6DNL8XfEU6vluVyEmfW+A
	 wuXsSAFRQO0krsezk5+9HSaCvKoCsKbrujDMHmFAYeK4XqvDi6pembTme7Gu6yNd0ZJ9+
	 AIcZaZN0LviEFsVneoQRnKqDJRDX+EAt/Sdl8cawaLwDoLk4hk2zY9iUWmekOad2ubEvr
	 A2Jl5Uyq4tfgeASxtWdgCPMHH6lTRtkx6eYgCiyv23PVdIenOZYNMxJilHv2/WFb7mwwg
	 ZeiIqfahw3OTEnWBIW8hn9eojujuGln8K1m75yNGSoYSHHNlq49nII/JUQaznNP/ALQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=XumbsbC5;
	arc=none smtp.remote-ip=220.197.31.2
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24EC6606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 04:17:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24EC6606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=XumbsbC5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=8E
	qyXa9InHENTTrj2gvqAPynFFShKveNH2iKhVcGlXs=; b=XumbsbC5BTPgEdc1CI
	4mMfPAZ9UhwMhrT1x28pcqdBkH5abpkbkYojZhak/NXBfk3He8migSTSZyHn30I0
	fmQrOH2CWkMVgCQujZvCxrZe6Z+1kjilir3xfxcYJxTl9PdHwLdxxTXg9SSG6Cy9
	tCLgeWVhcrCO2WQSmZ0jGwYLQ=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wDHjs7+d_5qJet0IQ--.39305S2;
	Thu, 19 Nov 2026 12:16:00 +0800 (CST)
From: Haoxiang Li <haoxiang_li2024@163.com>
To: lyude@redhat.com,
	dakr@kernel.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	haoxiang_li2024@163.com,
	martin.peres@free.fr,
	nouveau@karolherbst.de
Cc: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/nouveau/iccsense: Free temporary BIOS rail table
Date: Thu, 19 Nov 2026 12:15:56 +0800
Message-Id: <20261119041556.2837468-1-haoxiang_li2024@163.com>
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
X-CM-TRANSID:_____wDHjs7+d_5qJet0IQ--.39305S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Ww43WFykAF43AF17Gw1UAwb_yoW8GFykpa
	1UGFWYvrW7Xa1UtrWqy3WUGF1YkanYkFyxCFyYgwnavr13ArW093yjqF4jvayxJr4akw4a
	qr4DKrya9rs0k37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JUUhL8UUUUU=
X-CM-SenderInfo: xkdr5xpdqjszblsqjki6rwjhhfrp/xtbC7QF45mr+eAE6YQAA3E

nvbios_iccsense_parse() allocates stbl.rail, but  never releases it,
leaking the allocation both on successful initialization and when
allocating a runtime rail fails.

The sensor and runtime rail objects store copies of the parsed
fields, so the temporary table is not owned or freed by the
subdevice destructor.

Free stbl.rail after processing the entries and before returning
on runtime rail allocation failure.

Fixes: b71c0892631a ("drm/nouveau/iccsense: implement for ina209, ina219 and ina3221")
Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c
index 3ccdbbe2fad0..85fd891442e4 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c
@@ -280,8 +280,10 @@ nvkm_iccsense_oneinit(struct nvkm_subdev *subdev)
 			}
 
 			rail = kmalloc_obj(*rail);
-			if (!rail)
+			if (!rail) {
+				kfree(stbl.rail);
 				return -ENOMEM;
+			}
 
 			rail->read = read;
 			rail->sensor = sensor;
@@ -291,6 +293,7 @@ nvkm_iccsense_oneinit(struct nvkm_subdev *subdev)
 			list_add_tail(&rail->head, &iccsense->rails);
 		}
 	}
+	kfree(stbl.rail);
 	return 0;
 }
 
-- 
2.25.1

