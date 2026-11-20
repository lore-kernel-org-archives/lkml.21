Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795173280;
	b=UPNqljmZX17mEKaxAYpCNVyBSNhqvxyUsFMf2Mpq3w/xb3czostIbZTf3jKsDfvSWT3h
	 x+hG1wMCkcVreraLE2cAHT6vHKsGiUdWjOJOKBd0NvjqkJ70UmRxsz7bMzYYM+cplGhpo
	 6DcdXJ6CBlKEFu3FQzO3ndyNR4TJAPR4jMJw4JaWOgcT/wYuX/FwkljHRfgd4jVLjk373
	 7FBIh8SuMQ9A6e7qnNImpbQYAecgaIucXMc9YQrwFMTrd6vfo5cPyBX/LDfkbk/ojeP1p
	 gsu0tUJ5bms8PYJsLjjOJ2/7ufSWWdORlHOlmn1Z2ZvZ/UZmzeWj5JCXAKnRDEU6YWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795173280;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=TFaLTkb3JIz7GQaQVuyrLV1Wx+zOtsmXJl8m0I4Yjds=;
	b=U0/ZgC3G9AoXknBmFMMCVz9O0fw1fwOdzJtSxknfER8CM9qMrmRKRVcaAAFmffCd2SM0
	 b8vomq0RuqtytCtBriKGiF4pLeQVdaQVGM3qCn1Cq8QlQtFYktFsWBFsRtLZNWSDdB9wQ
	 +SpeE+KeayMazn9uGY05BYhayntYwZzqUeASs4m/veSdJDS4ruyc1mE1kEbyAxBplpvHh
	 kZtPGDlOZn/vt+nMbNcqOk8Yz2r5FDT419SZttZg/wDbqKogZ3DGkGHwWeZ4DK1304TdX
	 5aDhOO8QYlXM+JV0X78zjEz6OJ9hbsBNolENk6AGfc1jx8cbsEyw5kWH3aPtBJtXN1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FAn9CKVD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C50460A2626
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FAn9CKVD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DC671F000F2;
	Fri, 20 Nov 2026 11:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795173280;
	bh=TFaLTkb3JIz7GQaQVuyrLV1Wx+zOtsmXJl8m0I4Yjds=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=FAn9CKVDAfPfOVfV5KlNbHOpQRdf9ryKwCmTkQovpPuEjgwCZDhtUeWvFQnbEdyo3
	 nlabDeV0nw5uTz84yUl03ROr84QbhyWD2jQs1RzewuPHB/VsnA12ieMh1p0hng/M97
	 VgWaDM9R6HmVmiNC+IBn7PVEINLidwW+SiO0msR1CfGf/B9pdJ1ruj+7qhVG0ZE52j
	 Cmu8UdcVPdOpZWwDHIH2bRF3NhFcgbrGb5qhWcE+0anFJ/7eEZtIzfVg+qfC+nw4Sp
	 ZiiI+/osGw0uDtqrhhje6ZBG9bjHza/OO1oeEexHkjxmx1g8BPqAl9Jw6eVE4cjRie
	 XOPWNdltRvLYQ==
From: Hannes Reinecke <hare@kernel.org>
Date: Fri, 20 Nov 2026 12:14:07 +0100
Subject: [PATCH v4 8/9] nvme-fabrics: allow to pass in keyring by name
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
Message-Id: <20261120-dhchap-keyring-v4-v4-8-5f8c7d9926ee@kernel.org>
References: <20261120-dhchap-keyring-v4-v4-0-5f8c7d9926ee@kernel.org>
In-Reply-To: <20261120-dhchap-keyring-v4-v4-0-5f8c7d9926ee@kernel.org>
To: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, 
 Hannes Reinecke <hare@suse.de>, Chaitanya Kulkarni <kch@nvidia.com>
Cc: linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Hannes Reinecke <hare@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795173255; l=1784;
 i=hare@kernel.org; s=20260619; h=from:subject:message-id;
 bh=f1C93uiJ/WUy1raIiWqFOPTRT80iE/5VXapinRQ4azg=;
 b=ANpghUVOkX3/OVC+8DmErShCCbT6qgn94Wji2tFxC4mJxTvz2DLxM/Bor9PyeKcQ9wknYdszT
 XVMfZ385NOjCIh7RoyozBZSJQkM7ZG17UUI2n2kQ8a37yYsScFksf1w
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
 drivers/nvme/host/fabrics.c | 25 ++++++++++++++++++-------
 1 file changed, 18 insertions(+), 7 deletions(-)

diff --git a/drivers/nvme/host/fabrics.c b/drivers/nvme/host/fabrics.c
index cd728768a68fc41135967cae44b1c3c5b0676dd3..71da67b543aa49b6e1a3721313d984f2e50e0ab4 100644
--- a/drivers/nvme/host/fabrics.c
+++ b/drivers/nvme/host/fabrics.c
@@ -14,6 +14,7 @@
 #include "fabrics.h"
 #include <linux/nvme-auth.h>
 #include <linux/nvme-keyring.h>
+#include <linux/key-type.h>
 
 static DECLARE_RWSEM(nvmf_transports_rwsem);
 static LIST_HEAD_GUARDED(nvmf_transports, nvmf_transports_rwsem);
@@ -993,13 +994,23 @@ static int nvmf_parse_options(struct nvmf_ctrl_options *opts,
 			break;
 		case NVMF_OPT_KEYRING:
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

-- 
2.51.0

