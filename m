Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=141.14.17.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795473701;
	b=PB22YEq8mdo5chVJy3mA0+qfdfiRTA85obZj3ZUB01ac9Pom8Ywqpn6WYNje+ID6z7EB
	 HOvwUNU+DsQVMTzOMkY9gugTINphCOEQgECSvg47VIRf3eC27LfH/V6wKpPA6pDTJPAss
	 1E2ftBvplXzf4xfWEnQ7kpmrivK0db2r9lZ9cI9nP6fEE30hGse54EWjPRiGEI+uNU5S2
	 t1fpxmvPjh0Q/NSPcxn5hudZc1L/fsjUan8dD+UEv309QICyM62MmPfa5tp1tsjkBpx7L
	 sJpbLkmO65/m4pWe46YYQYwywz+mGQ92Gi4TyApnxKQzF6AK3wX8JngD8kgtGuZ7vvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795473701;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:DKIM-Signature;
	bh=P679Rl3XhQ1PcDNlcvazMnRpUQ1twsPQEDJNLqeUCt0=;
	b=MTKZTyd5GHvd9xxkLAcW+DXg9L1LxQ1cs0kHeWH6jIXj4EceOXo+ZBeD1LK2TmYnWgfI
	 vdriioAwi76q8SNgUrXy43NIP4UtxP/Ypr49WXtcAl0SFfMNEKwK1AUUAtAJ5gbx6K5th
	 6ywRsZlHlWtbluVSlCJWqCn2d4iRUzLTR/Cc6lDhHz3ZcSFEbsfuTgVEFqdaDgWHQOrTa
	 dPpELiYV9tc70ylxmbxqi4osjqKTk321UiwgUR+UwsneFZlMV634vQzP7DLpzEaP1/1iN
	 V485+j9ymIaDopX29dm78FOVCHkUQjFpQjbA6FZhcfajZbyEJPQsy5zBgCJL/NOGlMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=molgen.mpg.de;
	spf=pass smtp.mailfrom=molgen.mpg.de;
	dkim=pass header.d=molgen.mpg.de header.i=@molgen.mpg.de header.a=rsa-sha256 header.s=20260906 header.b=lqRIXnIl;
	arc=none smtp.remote-ip=141.14.17.11
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E899A606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 22:41:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E899A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=molgen.mpg.de header.i=@molgen.mpg.de header.a=rsa-sha256 header.s=20260906 header.b=lqRIXnIl
Received: from abreu (ip-095-090-245-070.vkd79.pools.vodafone-ip.de [95.90.245.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 758B24C442F809;
	Mon, 23 Nov 2026 23:40:34 +0100 (CET)
From: Paul Menzel <pmenzel@molgen.mpg.de>
To: Keith Busch <kbusch@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>
Cc: Paul Menzel <pmenzel@molgen.mpg.de>,
	linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] nvme-pci: Add IGNORE_DEV_SUBNQN quirk for Phison E19
Date: Mon, 23 Nov 2026 23:40:18 +0100
Message-ID: <20261123224020.134113-1-pmenzel@molgen.mpg.de>
X-Mailer: git-send-email 2.55.0
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=molgen.mpg.de; s=20260906; 
	t=1795473634; 
	h=from:from:subject:date:message-id:mime-version:content-type:content-transfer-encoding; 
	bh=P679Rl3XhQ1PcDNlcvazMnRpUQ1twsPQEDJNLqeUCt0=; 
	b=lqRIXnIllF9m9FMdQz2sCp8x6Q0K6x9rWIe7ifeKCi4g0ijxIOMgpHprI8kowuRfSTP/0uV9kIvQ
	dHFuN4+8H9EO2PEwjNGbHvZt6FexuTqCi3NEqAjorz8aKTCLLAQUIk7HRvc5UXijRlz9pY7t3AyW/C
	I/s8gFymp3cL6vgActokfdhFGjiyHmsNDc8cqWt4wL7x+UPcLqaj0YxfMOXRGH5gIvpOcJ2Qi+LEVE
	X+5eS9jbz/bVoPRGoGmdbiyXw27dNfPMz5W2mgVDb2ygyWSnYC3ctPFERyYDQvUKRam0CJJLGIzq8U
	cY4VU3vJGzZSH2DlVJRU5bFcZ8/o492A==

The Phison E19 (198:5019) in a Dell XPS 13 9315 reports:

    $ sudo nvme id-ctrl /dev/nvme0 | grep -E '^(vid|mn|fr|ver|subnqn) '
    vid       : 0x1987
    mn        : ESE2A044-512 NVMe Phison 512GB
    fr        : 19010008
    ver       : 0x10400
    subnqn    :

So every boot warns:

    nvme nvme0: missing or invalid SUBNQN field.

and the kernel falls back to the generated NQN anyway:

    $ cat /sys/class/nvme/nvme0/subsysnqn
    nqn.2014.08.org.nvmexpress:19871987298E07241E4B00121487ESE2A044-512 NVMe Phison 512GB

Add NVME_QUIRK_IGNORE_DEV_SUBNQN, as for the Phison E16 (1987:5016), to
use the generated NQN without the warning. For this drive the subsystem
NQN stays the same.

Signed-off-by: Paul Menzel <pmenzel@molgen.mpg.de>
---
 drivers/nvme/host/pci.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/nvme/host/pci.c b/drivers/nvme/host/pci.c
index 076603df01abb..ba5b1cdbb95e1 100644
--- a/drivers/nvme/host/pci.c
+++ b/drivers/nvme/host/pci.c
@@ -4398,7 +4398,8 @@ static const struct pci_device_id nvme_id_table[] = {
 		.driver_data = NVME_QUIRK_IGNORE_DEV_SUBNQN |
 				NVME_QUIRK_BOGUS_NID, },
 	{ PCI_DEVICE(0x1987, 0x5019),  /* phison E19 */
-		.driver_data = NVME_QUIRK_DISABLE_WRITE_ZEROES, },
+		.driver_data = NVME_QUIRK_IGNORE_DEV_SUBNQN |
+				NVME_QUIRK_DISABLE_WRITE_ZEROES, },
 	{ PCI_DEVICE(0x1987, 0x5021),   /* Phison E21 */
 		.driver_data = NVME_QUIRK_DISABLE_WRITE_ZEROES, },
 	{ PCI_DEVICE(0x1b4b, 0x1092),	/* Lexar 256 GB SSD */
-- 
2.54.0

