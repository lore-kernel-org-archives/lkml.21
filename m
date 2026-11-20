Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795202514;
	b=nzz6o3L18HMsSlFh/wqiMvtZz3gCSnc++eINv0Y/IqH7YYCpDF+KJQP+lFGnxEE/nZWr
	 whi/rTSlPF/jLEe0YjUhFqDdt9JuUwkPrS4TuQISteoRS39HcSaLNlsuSpLIuQu+XwTPO
	 JfHbgWjyLliyNX5ZsZZS2OSVvesu73x8rvmLkcz4IfSwrE/VDgJYgrpnB5n+9EbwBO1up
	 hycqzMEucoX5WonEC8tWwW5hqTpGc75V9TGPnojZ3yf0REKMICR3YtTgNt5zp99V4PrpT
	 CMI65Zko0P+7rI1F+QbxcMhiFCOK/2jRrDBFae8imF4kUvKGNpJYhQmGGvTPBUrUbiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795202514;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=DNVNmDF5dVzvlnQ4zjX9N+gfP3FXX+TLZ7yfkqU1zlQ=;
	b=yF6CjL96nFvXvxZGMXU+vJoym5XPS8uB3y57OGDylwPFuAn8kg75EbR7tiBJQ+qSmC1X
	 uMUnJ3LmcTnBZOVxQzVEQdbC2lazU4yoJzWxdlH03hyCeb51qtE3RPiu2Zd1IbIrLo1rD
	 OVGkodAylIP4SHDLysFdYVfPxpedqH49RQDQCAAGN/k3mQwifdGLS2Nkj3vtfjIZ/ntZ/
	 hgrF6DDrFaVHkgKAsS34P/0U6skXUrfJcQNE/g9rU9nBcL6oGWzmjOtd5wQn/9UbXtdv7
	 Om3KnN3enLvTNegVkDikkINQazXbJWx0bSZu3Hxh/nzTELrgwh1nD5OB1KTBeI8m7XA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SzrwrMAI;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B6AE60A2605
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 19:21:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B6AE60A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SzrwrMAI
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-384c78aa0dbso1604592eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:21:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795202507; x=1795807307; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DNVNmDF5dVzvlnQ4zjX9N+gfP3FXX+TLZ7yfkqU1zlQ=;
        b=SzrwrMAI6w2Pg7sUGLzQCLAIE+VEn2mobElZeDgUZcyhYHRg61eBMHhOdIbBBP9Voc
         P0BzYlqlAEWICXYSDYPmTOGs12hlseGz6/laF3SaXEoF+InbfzvmHHFkFSee5VyYlh6n
         X5U30rf0HvOX/9evov2bKnFaLUK675oPPbmiRuv1+iwN+Nr2EpcKf938Svk3SZuwM5DW
         zEoyQ4ecjaMQa0D1UnGy6dLIg1moTV0JDyu3+1T776jwuq2ZIktM77zeFr8WFxvi5HO8
         2vU4vqM7u5XEj9a60us8yDYdgaDW06e/7DNpeQyrqznS6q/HQVJYjxARE4ION/KmJLkZ
         FNwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795202507; x=1795807307;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DNVNmDF5dVzvlnQ4zjX9N+gfP3FXX+TLZ7yfkqU1zlQ=;
        b=G/tlerxAXgVwrJKMi891kykqxtVKsDZ2290WXxwmKA6TsxQ7HauE8TtwSvv/fMhw+B
         x+TcKakmKLK3cx404uP32r80SPN2d8QkD02A0YlSFxcgH1hxvH+GspduNAxIZcb94XrK
         mnWzITHq47/qNyZq9J+vYIFHvmzaQtg4qRIVJwc/MiVoYdmoShxS39/GopiFUfTq8Oou
         PhzAxjCiwOvy0ko4LCPfbOB1l+pdY6NmGG7J4JSDQF82ojDqfF7JuxIIx3sTpAZNuWJ4
         RwZAcOCXVvOGt9yqAxf/H/SYLvBEdiRrBMalaqineZT5fsb3T1rszsz9MKbzhO5jtIaw
         Ad0w==
X-Forwarded-Encrypted: i=1; AL+hErFTEBibyVr1HVjmzAymmqBnf1DExqXbHIRAhTSmpdKmmHmg0htMgQ1WAGGaZ1PI90YK+wz+lzGb5y7Dbss=@vger.kernel.org
X-Gm-Message-State: APuU4Z/t3zjhdigcE1zvam3joM/boRpuLFD1KCQfds+HSZRQIo/yay2a
	HBZEfWOEkVA4TiSRIi9hlo7Lh2k6fkuUBbr5gVIp5Z2CkSAmGyKaUcLKHgcEENDVY2O0rJP3pyH
	dYg==
X-Received: from dycqw15-n1.prod.google.com ([2002:a05:7300:c00f:10b0:36f:5688:8a11])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:ff48:b0:385:3595:5e87
 with SMTP id 5a478bee46e88-3856fd5b5damr3386093eec.16.1795202506690; Fri, 20
 Nov 2026 11:21:46 -0800 (PST)
Date: Fri, 20 Nov 2026 19:20:50 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261120192050.2868566-1-elkin@google.com>
Subject: [PATCH] drm/xe: clear backup ERR_PTR before retrying in xe_bo_evict_pinned()
From: Elkin Cruz <elkin@google.com>
To: Matthew Brost <matthew.brost@intel.com>, 
	"=?UTF-8?q?Thomas=20Hellstr=C3=B6m?=" <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, irogers@google.com, 
	Elkin Cruz <elkin@google.com>
Content-Type: text/plain; charset="UTF-8"

In xe_bo_evict_pinned(), backup is initialized to bo->backup_obj (NULL)
outside xe_validation_guard(). When xe_bo_init_locked() returns an
ERR_PTR on lock contention (-EDEADLK) or OOM (-ENOMEM),
drm_exec_retry_on_contention(&exec) or
xe_validation_retry_on_oom(&ctx, &ret) restarts the loop while backup
still holds the ERR_PTR. On the retried iteration, "if (!backup)" is
false, passing the ERR_PTR directly to xe_bo_evict_pinned_copy().

Extract ret = PTR_ERR(backup) and reset backup to NULL before
retrying.

Fixes: 844150c255c9 ("drm/xe: Convert pinned suspend eviction for exhaustive eviction")
Signed-off-by: Elkin Cruz <elkin@google.com>
---
I am trying out a new Clang static analysis linter for ERR_PTR/NULL
handling, and it flagged this code as possibly buggy. The findings were triaged
and fixed with an AI coding assistant, then checked against linux-next (not
runtime-tested on hardware).

Thanks,
Elkin

 drivers/gpu/drm/xe/xe_bo.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 353ac1e9a9d6..ae6fd20304ce 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1680,8 +1680,9 @@ int xe_bo_evict_pinned(struct xe_bo *bo)
 						   XE_BO_FLAG_SYSTEM | XE_BO_FLAG_NEEDS_CPU_ACCESS |
 						   XE_BO_FLAG_PINNED, NULL, &exec);
 			if (IS_ERR(backup)) {
-				drm_exec_retry_on_contention(&exec);
 				ret = PTR_ERR(backup);
+				backup = NULL;
+				drm_exec_retry_on_contention(&exec);
 				xe_validation_retry_on_oom(&ctx, &ret);
 				break;
 			}
-- 
2.56.1.750.gf70dc682cf-goog

