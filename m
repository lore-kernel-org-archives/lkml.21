Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795202679;
	b=EJziWZc74hqgmLSjnISfkiI0HYaDoSg1SQQedTsCh60bSfUxmUJCxkiEATseuuKH1KNX
	 HpIKgv+hbwWknQVNUHs1pe5Z15LHuiknVf0SGmhOT9OY/sXrDYuTNhPlbLLr18tDScUdK
	 Ka/LaT9j0K5DVbI4FuhaoQBn2bX//8xAnE/r8Rf7nwwL5T6+4VPPFOY9/w7xcc5nQWQGA
	 FYwxYDLNcURqAQVMcbmHs1CC13BQWXjsICjniuDEm9GpRnowrenXNXuhE+U9bfU6u+jO9
	 6oQ6939kqtFHwYsBWdfd6s/U6FbM4l89eeVmEfeRPT9Q/wpgP1ol5fcketgSpyuN7zQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795202679;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=3eCsb+viwl+9J6PmvDVW9XfbcZ8OzCUWLQRD34ONgF4=;
	b=BNUpfIP4fZHdaOLPVIxeOE8Nv78A4I2kWnJ0YnUkJtjc3Fc7zihHDeaEnD5SNjp8R/P+
	 j3WBmpXY18cR04/67s/IBHgrKViXuxlx2cNHiD2AUywMuF+2fbUQFmUTeXvcLn5GR+M4r
	 Hy58kLn6mH7psP7fEiW3nlWQrX5Vj9UDtUdH4J9RLVuY9m9TOzPof631j79vfp23mt3k/
	 Zs6g4cyf3Od+vo0ru7HT8+6BD+5yTWcHGUzzve61K+m1VsfP5spQvanl+6gGw7maWMTxo
	 g7bE3+URVSI2m7wc7pN2LBBN8asWJ8dcWyL08oQOvB9s6OeFUt9YKcpMuo6uqleYzlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=j+TqSiKW;
	arc=none smtp.remote-ip=74.125.82.70
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FDE7606A6CB
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 19:24:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FDE7606A6CB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=j+TqSiKW
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-16bc6f3fdb1so856974c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:24:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795202673; x=1795807473; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3eCsb+viwl+9J6PmvDVW9XfbcZ8OzCUWLQRD34ONgF4=;
        b=j+TqSiKWhOzhG43GW2W2hAAzDHKgR5YbpbWC6QCi+eniKPhE0DTI6QC7CqQHPF8+Tg
         2rOsZA8vfI84KG6GAh3vvLi4AsueD3Yw3wmXbomJroulBfjcoNAh+eE+mIWiYUvAKVKT
         UsGCxxL1gvlFgFX1MNFtxGoFEiUqKRfnVY2oSb7aNgukte0copL0Ii/hAbBjwlqriySP
         7lR1FnUcVJLOT0PeJaAENvBdyEz+ARwdE5GYoCBeOu1vT7PijkkBNVVrvvImrJZ2ljns
         wjJl7m4u37KekUSGjnhAmPM1yLuIjTXcF3LDlceHdrfwdX/wl1eGwihlffTvuW1vDCzq
         D3eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795202673; x=1795807473;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3eCsb+viwl+9J6PmvDVW9XfbcZ8OzCUWLQRD34ONgF4=;
        b=gaCYrr3BR9yxv5CCGOsmw3yEz5eoeLqCqenZhMrsFtgnvdy8frw6U6GoEveaFHyPFd
         309IMyu99jqHC0ZTGARQPWzZyzZfKxOoFTAk5UfAeVR1d6Yj+WcnS6uHjLQ0cPyXZh5N
         EA4siLh1sjVbTvRTzV/RWaucaz9alNgPsne1mjQUrAwqJgikeN2ZwbfazzYG2yq1844j
         63aFN2PYhoYA/YxYxKVBpAfaGHSHkzOJ8TiM4OvnqkCGGmh4ifxzWKozUraZBm+cCFS5
         7YlQhklXdmmWzKRGROzaZVbU8ql7NhaY+UUIMej2Ra8nCaf+dRr+tW0iTKXDhYz+o0tA
         7jAw==
X-Forwarded-Encrypted: i=1; AL+hErFfudUlzjgPvqc/1PqybT7dkEag8JJZe98sCcyqPXmoOE+FaHlsvZ6E8S3Od2ScCfFR2PJSMSMFrnpB2DM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8iaCj2kcE0rmgesuRidZ2aNWO9GvVuKoHPI0OEiXSD9aU90m/A
	ZM3oBC+ekAX7enH4ugLxj2XgAT823YM0MJWLYpQwk41zq6VQ1dbXsRwJ2BM8Pj/PE3p7umeXFjJ
	XPA==
X-Received: from dlep16-n2.prod.google.com ([2002:a05:701b:4590:20b0:163:a42e:b837])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:7f0f:b0:1b5:1a7a:2ebc
 with SMTP id a92af1059eb24-1b556880d97mr3649433c88.16.1795202672080; Fri, 20
 Nov 2026 11:24:32 -0800 (PST)
Date: Fri, 20 Nov 2026 19:24:08 +0000
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
Message-ID: <20261120192408.2872793-1-elkin@google.com>
Subject: [PATCH net] octeontx2-pf: handle cn20k_pfvf_mbox_alloc() failure in otx2_pfvf_mbox_init()
From: Elkin Cruz <elkin@google.com>
To: Sunil Goutham <sgoutham@marvell.com>, Geetha sowjanya <gakula@marvell.com>, 
	Ratheesh Kannoth <rkannoth@marvell.com>, Subbaraya Sundeep <sbhatta@marvell.com>, 
	Bharat Bhushan <bbhushan2@marvell.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	irogers@google.com, Elkin Cruz <elkin@google.com>
Content-Type: text/plain; charset="UTF-8"

On CN20K, cn20k_pfvf_mbox_alloc() returns ERR_PTR(-ENOMEM) when
qmem_alloc() fails, but otx2_pfvf_mbox_init() assigns hwbase without
checking IS_ERR(hwbase). On allocation failure, the error pointer is
passed directly into otx2_mbox_init(), which writes reset headers to
hwbase + devid * MBOX_SIZE and crashes the kernel.

In addition, if otx2_mbox_init() fails on CN20K after
cn20k_pfvf_mbox_alloc() succeeded, free_iomem: skips
qmem_free(&pf->pdev->dev, pf->pfvf_mbox_addr), leaking the DMA mailbox
allocation, and if the second otx2_mbox_init(&mbox->mbox_up, ...) call
fails, &mbox->mbox is not destroyed.

Check IS_ERR(hwbase) and update error unwind in otx2_pfvf_mbox_init()
to properly clean up &mbox->mbox, free mailbox memory on CN20K, and
clear pf->mbox_pfvf_wq.

Fixes: 70f8986ecef1 ("octeontx2-pf: CN20K mbox implementation between PF-VF")
Signed-off-by: Elkin Cruz <elkin@google.com>
---
I am trying out a new Clang static analysis linter for ERR_PTR/NULL
handling, and it flagged this code as possibly buggy. The findings were triaged
and fixed with an AI coding assistant, then checked against linux-next (not
runtime-tested on hardware).

Thanks,
Elkin

 .../net/ethernet/marvell/octeontx2/nic/otx2_pf.c  | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/marvell/octeontx2/nic/otx2_pf.c b/drivers/net/ethernet/marvell/octeontx2/nic/otx2_pf.c
index cb602a4adcfb..e6722751de7b 100644
--- a/drivers/net/ethernet/marvell/octeontx2/nic/otx2_pf.c
+++ b/drivers/net/ethernet/marvell/octeontx2/nic/otx2_pf.c
@@ -618,6 +618,10 @@ static int otx2_pfvf_mbox_init(struct otx2_nic *pf, int numvfs)
 	 */
 	if (is_cn20k(pf->pdev)) {
 		hwbase = (void __iomem *)cn20k_pfvf_mbox_alloc(pf, numvfs);
+		if (IS_ERR(hwbase)) {
+			err = PTR_ERR(hwbase);
+			goto free_wq;
+		}
 	} else {
 		/* On CN10K platform, PF <-> VF mailbox region follows after
 		 * PF <-> AF mailbox region.
@@ -644,7 +648,7 @@ static int otx2_pfvf_mbox_init(struct otx2_nic *pf, int numvfs)
 	err = otx2_mbox_init(&mbox->mbox_up, hwbase, pf->pdev, pf->reg_base,
 			     MBOX_DIR_PFVF_UP, numvfs);
 	if (err)
-		goto free_iomem;
+		goto destroy_mbox;
 
 	for (vf = 0; vf < numvfs; vf++) {
 		mbox->pfvf = pf;
@@ -655,11 +659,18 @@ static int otx2_pfvf_mbox_init(struct otx2_nic *pf, int numvfs)
 
 	return 0;
 
+destroy_mbox:
+	otx2_mbox_destroy(&mbox->mbox);
 free_iomem:
-	if (hwbase && !(is_cn20k(pf->pdev)))
+	if (is_cn20k(pf->pdev)) {
+		qmem_free(&pf->pdev->dev, pf->pfvf_mbox_addr);
+		pf->pfvf_mbox_addr = NULL;
+	} else if (hwbase) {
 		iounmap(hwbase);
+	}
 free_wq:
 	destroy_workqueue(pf->mbox_pfvf_wq);
+	pf->mbox_pfvf_wq = NULL;
 	return err;
 }
 
-- 
2.56.1.750.gf70dc682cf-goog

