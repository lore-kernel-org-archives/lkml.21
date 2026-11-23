Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795436120;
	b=VeB9coc8YNouu9vXeVr0RGzqYZNsEcTX48RGeAjbDFzJaLKXaWTw+1zwuKduOZeFfsQ4
	 Uq83C0QwNDlRd25r+r3hpvC9YQyh0ZQQ0IVn0j8nU9mVv9+ieVmk4kiwS7rW1F4M+Hl45
	 02Y8uyG2f5bMbhPlCEL+ILiocv+Zyr0k3YLWVFvOzdDHUtQXt8xf19QsDEG94iJ7I0scT
	 +u1MSFiyqMWPReAIleAr3LVNPCllPc3kwhvkc4/AttskBN6jAvsUbGFhi1cjIVzdvNB9I
	 yZOa77OqEkBHLuhSQDiqaqrYnaKauvnx28SJxy22KRZqlCpNcNkOLG/lEDQZdCFp7ng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795436120;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=edOYJZi2pvk7QHfQ0FQGaT9yr6iTz17TIgeP8+QqIew=;
	b=lODXfPK12aBjV21P2/FzMWE9Gu2+UYclhNbPnp0o1EBTWFlXgkJBYllGAVLTDIuHc62O
	 XI5qU2cFKfo+qazhZehqlH3apXLGaif0aj1oAAjtSalQvLEelbfApTXYcGV9zomtfRRrN
	 23ehWx3PLZNmieMIp+b0yFsLynI95JDg8RPXpXb3HL7zBiJiqFy5tVpHArPppNLH8oxim
	 pnhxTuYhWamP/zhjkdq8G75OMVKsKZVwSdK7jOp501b7DuWmagH2tVb+RLP1btez0tEVN
	 zAsm6QLE4UTVNEdo9SjpbAZqUWWN5a/rbrAuikuZ7JQd1CT/1igh9JCdKsJDlO/VKiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MwfrQPG6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04151606A327
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 12:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MwfrQPG6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C68551F000C4;
	Mon, 23 Nov 2026 12:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795436119;
	bh=edOYJZi2pvk7QHfQ0FQGaT9yr6iTz17TIgeP8+QqIew=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=MwfrQPG6khZsoQMO0x3LuH/Hucieb93Zcny5lZhsGd9gbPD0NChRJkd4pxL39BvJ1
	 pccrm5P2tE5QECtqGeERKrOBU9X6qYpMxi2rcsQmlt6/SBxtfpBkjKyt1ZfAuHVekt
	 agzBXDz/KxqoC/1psxJcW/GH5cErh7YBbO7c8rh7RC1eTWAs5lGjJT+pQXDe4Ug9OB
	 OAv0PGvNoAsGqMQpIxl+ihi+6yz3wUVH10P5qu+ymghsiupFspdlV3J7xfkfslLLPD
	 W1zMuXFbPvplLyxlT+LQbgEtBkPJGLIJt+Lf/iabGZpibC4R1jM8iGylAP+JWIx3hv
	 OKQ/CkFJW9rYw==
From: Hannes Reinecke <hare@kernel.org>
Date: Mon, 23 Nov 2026 13:14:53 +0100
Subject: [PATCH v5 8/9] nvme-fabrics: allow to pass in keyring by name
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
Message-Id: <20261123-dhchap-keyring-v4-v5-8-81eefb4c0724@kernel.org>
References: <20261123-dhchap-keyring-v4-v5-0-81eefb4c0724@kernel.org>
In-Reply-To: <20261123-dhchap-keyring-v4-v5-0-81eefb4c0724@kernel.org>
To: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, 
 Hannes Reinecke <hare@suse.de>, Chaitanya Kulkarni <kch@nvidia.com>
Cc: linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Hannes Reinecke <hare@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795436094; l=2397;
 i=hare@kernel.org; s=20260619; h=from:subject:message-id;
 bh=QIG3YycUOOma1J1ecMRHNnzCF9Qrfo4/YXZow6f9QVM=;
 b=bpLiR53mpxygQYP3CYeStm/+bdH9izRRf48oYzBz0SK4fWuRBCNaQqe6nL5UazzOMFKKOgDbL
 7So0bcYtNjhDByuvNgTaDtzPEr08Ysb6wOTGIWB8Z7fCWkjWbOhIm+7
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
 drivers/nvme/host/fabrics.c | 33 +++++++++++++++++++++++++--------
 1 file changed, 25 insertions(+), 8 deletions(-)

diff --git a/drivers/nvme/host/fabrics.c b/drivers/nvme/host/fabrics.c
index 1277749c6e2e3012b5161a7d03589a6ced300a05..5dc1e1d5fb4629b82b2bce4d37fe9ce5d17acab6 100644
--- a/drivers/nvme/host/fabrics.c
+++ b/drivers/nvme/host/fabrics.c
@@ -14,6 +14,7 @@
 #include "fabrics.h"
 #include <linux/nvme-auth.h>
 #include <linux/nvme-keyring.h>
+#include <linux/key-type.h>
 
 static DECLARE_RWSEM(nvmf_transports_rwsem);
 static LIST_HEAD_GUARDED(nvmf_transports, nvmf_transports_rwsem);
@@ -697,7 +698,7 @@ static const match_table_t opt_tokens = {
 	{ NVMF_OPT_NR_POLL_QUEUES,	"nr_poll_queues=%d"	},
 	{ NVMF_OPT_TOS,			"tos=%d"		},
 #ifdef CONFIG_NVME_TCP_TLS
-	{ NVMF_OPT_KEYRING,		"keyring=%d"		},
+	{ NVMF_OPT_KEYRING,		"keyring=%s"		},
 	{ NVMF_OPT_TLS_KEY,		"tls_key=%d"		},
 #endif
 	{ NVMF_OPT_FAIL_FAST_TMO,	"fast_io_fail_tmo=%d"	},
@@ -992,17 +993,33 @@ static int nvmf_parse_options(struct nvmf_ctrl_options *opts,
 			opts->tos = token;
 			break;
 		case NVMF_OPT_KEYRING:
+#ifdef CONFIG_NVME_KEYRING
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
+#else
+			pr_warn("nvme keyring is disabled\n");
+			ret = -EINVAL;
+			goto out;
+#endif
 			break;
 		case NVMF_OPT_TLS_KEY:
 			if (match_int(args, &key_id) || key_id <= 0) {

-- 
2.51.0

