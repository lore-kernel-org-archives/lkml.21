Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795453836;
	b=AsGC0Fjp7QOsAbdJKgVPnsQANgL84H25hGb8B0bF6C9Cz0R/lBYBsFMt23/5BRYZndgC
	 WhjsOOcqnYYG2G1uVnEe0EDJ7ffWR39JIyi8KyUhsEnxkk+UJn9a6iRrrWvK9OKlmVVV2
	 6vG3tTXgajg1GdxF6+YPtV/QOEFFg59gu8azo/dq0+rE8mmWFtUeLoc6vNlBoMfN36wny
	 4DQFZ3darnhJ9RS3o59Gvj8nN8kZd7uhpk0v9r3saiXdBoAwM7sKgtoyOUzNXpyOCdj3E
	 HL+z/2dXGApCzOLHZp5ZPrqU+oFzfGZo2IKKbrM/9g7zXp1laicGDJOUQe/EMB6yBJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795453836;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=Fs3FqRZzbQW0RewIgCSZdDBXczxL1ml7PaOPSTLmICY=;
	b=MoFQRYQCu74B4ZFAGcl0AGRizGCM4NW96YtuJ92qWZgNiNgkYdqRBZIHPUD4yljL9ta8
	 TBdosDCZTWf24XoI4XvB3U46lTerc1x48mQbl2q4qPsZ6BzxToLiG5TKUiVUEU9jbWgUl
	 4u69YTL8jW84kGR1nb33s2k93Cr0Sy+073B45Y0mXnoyCtMD0XRS0MRAYGSN8xp+nXIHT
	 1ToUXXdrkijmJaKU5xg/GD55WPlGbPGsXNNj4dT9TU5M9dkJTSpCumqTbYgzYRZqUykhu
	 xGr6rb7i/zBeuXsMMKhc1b91JMA2Rl6HGHywPeAb687aUJhO+sp/NQUrTBY4OTnQVow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B6ZEaits;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F23A1606A685
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 17:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B6ZEaits
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD4BE1F00AD3;
	Mon, 23 Nov 2026 17:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795453835;
	bh=Fs3FqRZzbQW0RewIgCSZdDBXczxL1ml7PaOPSTLmICY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=B6ZEaitsb8F6ruj0sbwOJpHqUJdoG6rCPd9eSRnw+Q1/n3PPlO9b1+Nj6cwN+pPuO
	 byyIKlJZkcQIaUTNjzVUtMdU0A6XuKYQq0+iE9DtOKwQEHTAesYzdjVeGLmTpcEBEj
	 bU28Yt9iax38UNGXDtOOAP97GL2FfiefFGfuhChtYFiwk6pxY2mTRLFevUeqYCxOzq
	 UcOS2K9H7RsSZMXN56fZis4wMznBpR7aQfCpKr4GZv2+k8fN3T3xe/SQLc3hDJqq+H
	 LnA2PXuRpOtcw4f1gf6bjgb0nkTgk2FwFaqp6Z+GzurTGAE3lH+kUqs1ymjiSUEsa5
	 Ybak8gTuU3CmA==
From: Hannes Reinecke <hare@kernel.org>
Date: Mon, 23 Nov 2026 18:10:08 +0100
Subject: [PATCH v6 8/9] nvme-fabrics: allow to pass in keyring by name
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261123-dhchap-keyring-v4-v6-8-5082a49715ab@kernel.org>
References: <20261123-dhchap-keyring-v4-v6-0-5082a49715ab@kernel.org>
In-Reply-To: <20261123-dhchap-keyring-v4-v6-0-5082a49715ab@kernel.org>
To: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, 
 Hannes Reinecke <hare@suse.de>, Chaitanya Kulkarni <kch@nvidia.com>
Cc: linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Hannes Reinecke <hare@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795453811; l=2420;
 i=hare@kernel.org; s=20260619; h=from:subject:message-id;
 bh=ITKJc1nZRUkbL6beI0dJDy5VCw8yabe1G6B7/FWmKhA=;
 b=kNH+ZvatLTk1c/SMb9GRdgbdE6NknztFK3IUvfXpL55/dyQv6VaZzLoLXtCqIIzMpoxbymgZx
 Pa7nxxQCtV5COCC4laAHKl5FM7bK5uqC7rOLFZ1qlqjkSoBhPN9peBA
X-Developer-Key: i=hare@kernel.org; a=ed25519;
 pk=iekPF4ZZFva3sutm7d1ryPNR1G/WFfUgHaDB423JXho=

The current interface of passing in keyrings by serial number is very
impractical for configuration scripts, as the serial number is not
persistent across reboots, and so any configuration files will need
to be adjusted.
This patchs allows to specify the TLS keyring by name in addition to
the serial number to simplify configuration file handling.

Signed-off-by: Hannes Reinecke <hare@kernel.org>
---
 drivers/nvme/host/fabrics.c | 31 +++++++++++++++++++++++--------
 1 file changed, 23 insertions(+), 8 deletions(-)

diff --git a/drivers/nvme/host/fabrics.c b/drivers/nvme/host/fabrics.c
index 2937e5dc9ecd22fd3eb684e2dce909b41e5a6e20..aae094bbbf0dddfa507acae5e35ba94ffdbcb245 100644
--- a/drivers/nvme/host/fabrics.c
+++ b/drivers/nvme/host/fabrics.c
@@ -14,6 +14,7 @@
 #include "fabrics.h"
 #include <linux/nvme-auth.h>
 #include <linux/nvme-keyring.h>
+#include <linux/key-type.h>
 
 static DECLARE_RWSEM(nvmf_transports_rwsem);
 static LIST_HEAD_GUARDED(nvmf_transports, nvmf_transports_rwsem);
@@ -696,8 +697,10 @@ static const match_table_t opt_tokens = {
 	{ NVMF_OPT_NR_WRITE_QUEUES,	"nr_write_queues=%d"	},
 	{ NVMF_OPT_NR_POLL_QUEUES,	"nr_poll_queues=%d"	},
 	{ NVMF_OPT_TOS,			"tos=%d"		},
+#if IS_ENABLED(CONFIG_NVME_KEYRING)
+	{ NVMF_OPT_KEYRING,		"keyring=%s"		},
+#endif
 #ifdef CONFIG_NVME_TCP_TLS
-	{ NVMF_OPT_KEYRING,		"keyring=%d"		},
 	{ NVMF_OPT_TLS_KEY,		"tls_key=%d"		},
 #endif
 	{ NVMF_OPT_FAIL_FAST_TMO,	"fast_io_fail_tmo=%d"	},
@@ -992,17 +995,29 @@ static int nvmf_parse_options(struct nvmf_ctrl_options *opts,
 			opts->tos = token;
 			break;
 		case NVMF_OPT_KEYRING:
+#if IS_ENABLED(CONFIG_NVME_KEYRING)
 			if (match_int(args, &key_id) || key_id <= 0) {
-				ret = -EINVAL;
-				goto out;
-			}
-			key = nvmf_parse_key(key_id);
-			if (IS_ERR(key)) {
-				ret = PTR_ERR(key);
-				goto out;
+				p = match_strdup(args);
+				if (!p) {
+					ret = -ENOMEM;
+					goto out;
+				}
+				key = request_key(&key_type_keyring, p, NULL);
+				kfree(p);
+				if (IS_ERR(key)) {
+					ret = PTR_ERR(key);
+					goto out;
+				}
+			} else {
+				key = nvmf_parse_key(key_id);
+				if (IS_ERR(key)) {
+					ret = PTR_ERR(key);
+					goto out;
+				}
 			}
 			key_put(opts->keyring);
 			opts->keyring = key;
+#endif
 			break;
 		case NVMF_OPT_TLS_KEY:
 			if (match_int(args, &key_id) || key_id <= 0) {

-- 
2.51.0

