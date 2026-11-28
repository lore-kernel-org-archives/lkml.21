Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795847947;
	b=eDVwMmQ7+i6cO2aTfU1hYN/mopt5degpFwu1brqoqgUVYoz46zt7xwUeTZkVZlu4muqH
	 S93jP/t9Tw2W0uPi25Lt5AOGZx3bN5rfCRIvcy8v/hLRLPOP7t9+0vM/5Ko84oeIRPiX3
	 4Nm0CLuNmFh1ups10pjHdmbS0HXVA88dT4u/GhUIbi/GZ/q62/3O7+RYLmxmI3USrq+vl
	 bEP9MtBntizKZUd7G6cCUw6lZX6wCeuKJ+JV4HbBj7LYLrDgWxYn14ipkQ2mmk/rmxfrL
	 k/eRQHJa0FcZhQKI19c7khC6JpodadwSI1OWANapWxhFttjr/+r03V1pGrKvXI+fsDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795847947;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xJUrKT1/8wtWEpCHd0NA5Y6u4vvqC4B4ufA7sT35KDU=;
	b=pKN6BlckEM8G96i8scqRQIrZeREG+uAdfVrcXAf957BxNTyVLzCDs1tKTONKdqlTtafs
	 TexwQPwt0GrXI/8sJrxRIgOSmpWN4XK+KyW5ubKxn2rFSNuqMppFy019X+dqXNsNwfGHC
	 Xb0z9uclyArPpXdzCPv8l0AaaxHQtvp0ZsP2wRVW4Z743JOeXgrGnuja37fKqEoVpw0f3
	 K+aR8XKdqtMR9iHNSLFx5YKENfFdGirUtDQGpc61sBglJTEQvN0k3aeBG+/O0Hz0+PMM+
	 OIZV7yuHSkrcm+VurCR/n06YF60qV3GTKSq7Qt04wQhKi3YoxXLOxYnp3iKk4TkZYNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=furiosa.ai;
	spf=none smtp.mailfrom=furiosa.ai;
	dkim=pass header.d=furiosa.ai header.i=@furiosa.ai header.a=rsa-sha256 header.s=google header.b=ba1ahpFs;
	arc=none smtp.remote-ip=209.85.210.171
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5508606A321
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 06:39:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5508606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=furiosa.ai header.i=@furiosa.ai header.a=rsa-sha256 header.s=google header.b=ba1ahpFs
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8c20d68c83fso5137316b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 22:39:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=furiosa.ai; s=google; t=1795847946; x=1796452746; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xJUrKT1/8wtWEpCHd0NA5Y6u4vvqC4B4ufA7sT35KDU=;
        b=ba1ahpFsvnPvTWjwlgWebqQ4SWgoLMcNVxRiKonVgBgPSD8T6vzBQp3nq07y2iytb1
         tC9Q1CyjZilMGLM4HNmg2VqaDyshbLMwkdHS1qtLVJH3DYPfQRUzi9kv+Eiu3zWG08R0
         E471q5oXVMIXQkuw06RoDf7eu4VCUVn1e9blA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795847946; x=1796452746;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xJUrKT1/8wtWEpCHd0NA5Y6u4vvqC4B4ufA7sT35KDU=;
        b=HSPdMdnSHv0DgGlNMNZO9SRsGSNkX8s7c7IGH0H1NnLX62o96MQ8Xt9/V7O9tCpgVp
         Kaz1XSzJShn9TL1VvtCKPhQ1mjcgjLMMmeMwI1KX2BaUOF6vkS7E2xOWk1ldchze8PKG
         MFknOped8+IY4lRsdpx0+C5w7kyppJ/TaN7j9N+57bE/wJrpfvumHaZjvLexuL/gWrAG
         wDOMMGOEosW70Y55tHGCtFamxSiYMHC15w8ntnGF0IrMOdVTJpV0QpyvjmYAwqn3EVyf
         9oeSWr/EWA2U1FIKVcTqXrXYW3SddaXdQRC12FS7Xj/rusjKfHfcXj7ni/6gESLTG6M8
         BE2A==
X-Forwarded-Encrypted: i=1; AL+hErE0YTukbvvAtxKCM/RHkiGA8YKaluAqZ++82bdtcKofaM8YqcW5g/M4hrkgR2WtDwUaSMpUu0kolTMIH44=@vger.kernel.org
X-Gm-Message-State: APuU4Z+v+8Kmihy2ZkkaVB2ULdB9gmmQggiFk9HqBOorIjPpLFZvdMI2
	2AfuDMBQg8f+Q6aDxcVOz06GgKN+NG9OvZ3tKp8Erd8nRbmUELBC3IesJYqJVo0ZxZQ=
X-Gm-Gg: AZFdTZfFDgUjJeyqZNkmE2DS66jYon7evnTNB6GJCLr+8cF2KumA2wfsITBc86V286y
	2aF1Q2XIp3SlKfnYqUigO/Si+GiuZxPZxOMAKHKp3GXJee07oqNsZAy+o3U/DG1VijvR3HdVJkz
	8oFeohtK1VKdlWwvAORwxvkt7e6A9wA6muRblraW9aJ67IDRdu7rkujBhyIfmH+MwUfUPrNDq62
	zLTsMrEyG+5n+8IvpVFw523OCLZmNKb1FdOfiGhJ1Jgb0EeI1kLRHD22qe97dLs+FO71O7GKxpT
	pkCreNkuYczx/pAtkAmFBb6Kl/sryOcHuD4wILciAlEWHj2vj1KibwnTHLsnuWJMfzceHMvNGbb
	yiFHzr+C+trbfdnmv7+XuD2CQ03RQt5PT9QUHD7Korg1Mw8u0Z/nIbtiebU6RtTedpr5gwqyFJL
	zHobVhZBFqYLYhoaBGRQacHR3daY2KnWlHkd0uZtLUbNqr+IqJVjm3HLiE8yxrL1CyXc/7D6Duj
	zsYAAxKylRjy7f1GaxqZtmnLIN9oX3sSOSieg1gzyZ1fwiDIzCWomdY+kpX+rvAgsadDLVrDpwF
	KIivWuxgfgFRVRXi2L1cODjhhVRF9v4Vziw9k70iEGcSrxigZ+8zQbUE43dINb+BOgzzFTvQGhw
	Hh82NgDcuIjzc
X-Received: by 2002:a05:6a20:a106:b0:3fa:53f1:abf2 with SMTP id adf61e73a8af0-4014de5db77mr21193451637.29.1795847946035;
        Fri, 27 Nov 2026 22:39:06 -0800 (PST)
Received: from rock-5b-plus ([61.83.209.48])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87077944bsm13939838b3a.2.2026.11.27.22.39.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 22:39:05 -0800 (PST)
From: Sidong Yang <sidong.yang@furiosa.ai>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Oded Gabbay <ogabbay@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	Haoming Gao <Naixumogu@whut.edu.cn>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sidong Yang <sidong.yang@furiosa.ai>,
	stable@vger.kernel.org
Subject: [PATCH 1/4] accel/rocket: Reject zero-sized BO creation
Date: Sat, 28 Nov 2026 15:38:41 +0900
Message-ID: <20261128063844.1537615-2-sidong.yang@furiosa.ai>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261128063844.1537615-1-sidong.yang@furiosa.ai>
References: <20261128063844.1537615-1-sidong.yang@furiosa.ai>
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

rocket_ioctl_create_bo() does not reject a zero size (or a size that
wraps to zero on PAGE_ALIGN()).

When args->size is 0, drm_gem_shmem_create() succeeds with obj->size == 0.
drm_gem_shmem_get_pages_sgt() then calls drm_gem_get_pages(), which
returns ZERO_SIZE_PTR from kvmalloc_objs(..., 0), and passes it with
n_pages = 0 to sg_alloc_append_table_from_pages(). That function
unconditionally sets chunks = 1 and dereferences pages[0], crashing the
kernel with a page fault on ZERO_SIZE_PTR.

Reject zero page-aligned BO sizes with -EINVAL before creating the GEM
object.

Fixes: 658ebeac3351 ("accel/rocket: Add IOCTL for BO creation")
Cc: stable@vger.kernel.org
Signed-off-by: Sidong Yang <sidong.yang@furiosa.ai>
---
 drivers/accel/rocket/rocket_gem.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/accel/rocket/rocket_gem.c b/drivers/accel/rocket/rocket_gem.c
index 8f802df3e0f1..9f3d85e3dd30 100644
--- a/drivers/accel/rocket/rocket_gem.c
+++ b/drivers/accel/rocket/rocket_gem.c
@@ -66,9 +66,13 @@ int rocket_ioctl_create_bo(struct drm_device *dev, void *data, struct drm_file *
 	struct drm_gem_object *gem_obj;
 	struct rocket_vm *vm;
 	struct sg_table *sgt;
+	size_t size = PAGE_ALIGN((size_t)args->size);
 	int ret;
 
-	shmem_obj = drm_gem_shmem_create(dev, args->size);
+	if (!size)
+		return -EINVAL;
+
+	shmem_obj = drm_gem_shmem_create(dev, size);
 	if (IS_ERR(shmem_obj))
 		return PTR_ERR(shmem_obj);
 
-- 
2.53.0

