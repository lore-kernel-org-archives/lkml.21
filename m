Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795629627;
	b=yh6PDU+itgJl56iiUJWdKbvZ2+KG6Nc7Ycyy+XyHf/52jWsp19PuUK3uu/imfhrgzjLQ
	 uL4jivFQsiJ0GvsYYkkV9vDgQoMsWV+3eKCTGnlXINq8OTeOgwGyKQNx3y66bmVMzlHCx
	 DKDkqlKkbIS84M8vblXPxWqMBxICGnzle6pMpCRduyxvJ9vF2EbK/6blMIMhDFGOT8xlb
	 3FO9mpu3Tt9RbRILI6+v9j1SXHJRK70thXp5QTW//Q+Wj9BFoU+Q4EVGt5No3ibJKS6fb
	 yhOOhCgI/CIkNOEVryK5rTSTWhmdWVxehSRAt3+RQaJJMIwue+5bVPj5REcKzzT72og==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795629627;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xtCkJCoLS/gVcb2dtPhhAeiTjxZ1B1vQ3swxij7EqrU=;
	b=Dol30WjmwjsUn4+3OTHZowvDtLCISSTc9WzKgnOA/tYnxUZYZpKDRNx4PQWpQG2baD4D
	 cEVuH1znOsdyfIRfbRypJBtGt9iYU/r7BrdIX6OHde2uvE3xhB3aj5YXK5kVtaBy7bmw3
	 jvHhthsfBwuOObvmR/obu8t5uSfTEzhEXJl5AWLSvPxU5r+P15RlMsDkMgcQu0YIuD1Vm
	 4BGienq+zJOq+ELwZcsC+eurtf7lFXdagMd6mm0waHgQ8u6SoTUOzQuVgLnFVHjqdgPUm
	 clgKluKCXi8C6iJ5VCZoO5nVSaT6qdOjinW6eYOlN6jOf1cCj9mfRxsHrczx8XAa6Ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dama.to;
	spf=none smtp.mailfrom=dama.to;
	dkim=pass header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=QwcH6veo;
	arc=none smtp.remote-ip=209.85.215.182
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC5D6606A32C
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:00:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC5D6606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=QwcH6veo
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cc4be0e5351so4483310a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:00:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20260707.gappssmtp.com; s=20260707; t=1795629626; x=1796234426; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xtCkJCoLS/gVcb2dtPhhAeiTjxZ1B1vQ3swxij7EqrU=;
        b=QwcH6veoRwsoOjbdzXbJSS5dTRE1R7tkJJlsT5irxwjA5e3Uuq8ypVCxOiP66iZogC
         eTZJY4GsG3iTjZIUFLTisu2Jjtnq3ftGr6EzFDhmbELJcW2Q9ePfNpc5EEXBodVODt1t
         cTUEK4YJb+/+J2FfXZPKMIVF1GttGu3RsWo0FZrf7uibEWgx/YM3Ux4qOnySoZJcAjl4
         AqMxZqS7JrhTfM4YWPauUNSpp5NoMCwM56vWw1aNYkA3svD11BGtBF+vJaeY3FRKDdxW
         wL9UQHsv/j6YmRoLEl6o0SeyibGIjWPrXChxn6tXzeFWgofrfRKYx6JExGTbGhhmbwJH
         yubA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795629626; x=1796234426;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xtCkJCoLS/gVcb2dtPhhAeiTjxZ1B1vQ3swxij7EqrU=;
        b=kWOaOS9IRJ5R4LtrlzWPIWAK5xCO8NJAW2aR1geabsMUCb5Hz8Nhk+vmehO01xxJl8
         6eNfvvt9Lkds6xEVDB1AJouOWwNfZKMZDdVAMcXTfySPSPRCixufNIr6kpDV7tjNVNxH
         D4pbZ3HqwYZDlLjrUi6KYvcVpXevhgaBr+tGexNn3zOaCnUtZSHn+K8CCJAj48mEwjEX
         YIH5lEYrC8gyABFk5W1gqWGpGACxom3vflXUWzaiMub46ckofoBZce9zO/kFb1d3Eeh6
         XmUJH2ii6pmRCQAHzWBlfEq2p4QJBpOYCN79z77+Jc2s7/+aV7r9DRwtmJpsKprwXDE7
         3iUw==
X-Forwarded-Encrypted: i=1; AL+hErE3D9FEzAHlEVYFLWfs2ygzYcJCKWuViXH4JxrYVupJ/+ZCA2FNl/PvZnPujqqMUM/DImevzdLEgGQcZ8Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z8TaA4dWsRjIIb3TxcNhhr3jfcrujbFbzdIiu9hOWBRH3GwmNEf
	A258gfA8TFXszimnu+o8iS4nHaD2bYwCcJDcY1IdHmkvr6eCvAkoDH2QRqMJj6dVze53CL1uevA
	EloiN
X-Gm-Gg: AZFdTZd6ldAp9IocGDNW9SsFsJL+WCaNPM76hVqUURkNIumC3em0urN0ogwlu8rvMkD
	SG1idQlv3gNOntSnlugSDrYHQlLHdwWF3Y+Q4l9B3aPG2gcvjJZrfavA8R46Eta6Fd8o951BmEY
	Q8dINxh/x5GagDwqK4z/IIemDXZHexFD65w0vEEYljQrfWX8WH4yGO247qz+WcjNf51q1jCDexz
	SRkOUX35d8aQ4XNcxL0eifklgkcEvOE9SRsGZh4K676dRZZmAxcvWQnqzdjFx43GLz1ipE86DMx
	k2fYov4B1HGuCsy7c1/HYvY1CF5Dd8YxY6f12C1UfcXIU/fNbRHppOsRSHXgRQmV4geOW28piLl
	tW+ZgdLhZ5ast12hDM1AoLzSLbIWSU5MKHeHjjx0JWipgMMQrlxlENrTYx9miaOAqcpJeup4yAR
	Djavshh+FHuNM/msOAQUxjvXq/ZofgnrH45GfHj2HVDcDLnwYtPebu5rFGw1P2upkhGfZVKo3l9
	sU8QbiJj666vWQuvl2qGvq6obaZH4dma4d8CkwImCxBcVa1zIW8bpPaA8ml70LpcUO0l7aHl8JX
	dfobUa9h87RveWWp9ytw5Apem6lg+r7YezHix5wMDLk=
X-Received: by 2002:a17:90b:3b52:b0:3b4:15e3:3a4e with SMTP id 98e67ed59e1d1-3b41c92c96cmr19138756a91.41.1795629625782;
        Wed, 25 Nov 2026 10:00:25 -0800 (PST)
Received: from localhost ([2a03:2880:2ff:4c::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad8ef99sm29559107a91.12.2026.11.25.10.00.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:00:25 -0800 (PST)
From: Joe Damato <joe@dama.to>
To: netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	linux-kernel@vger.kernel.org,
	daniel.machon@microchip.com,
	mbloch@nvidia.com,
	Joe Damato <joe@dama.to>
Subject: [PATCH net-next v3 0/5] net/mlx4: TX helpers and deferred doorbell fix
Date: Wed, 25 Nov 2026 10:00:13 -0800
Message-ID: <20261125180021.1804204-1-joe@dama.to>
X-Mailer: git-send-email 2.53.1
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

Greetings:

I am working on adding support for SW USO to mlx4 and the branch I have with
those changes locally is becoming a bit long, so I thought I'd try to break it
up to make it easier to review and merge by first sending this prep series.

FWIW: I plan to include more detailed data in my SW USO series, but I'm
working on SW USO because it significantly improves performance on hosts with
an IOMMU and an mlx4 NIC. I have a lot of hosts like that in production that
would benefit.

Anyway, back to this series.

Patches 1-3 factor common code out into helpers which currently have only 1
call site each, but I will be calling these helpers in the SW USO code I plan
to submit next.

Patch 4 and 5 add code to track when a doorbell is deferred so that it can
be written in the drop path. This is technically a bug fix (and I need this
to avoid the same type of bug in SW USO), but since I have never seen this bug
occur in reality I am sending to net-next.

Thanks,
Joe

v3:
  - Patch 4:
    - Set doorbell_pending once in mlx4_en_xmit from !send_doorbell so
      XDP_TX doesn't write it (Mark).
    - Dropped Daniel's Reviewed-by because it felt like a significant
      change from what Daniel reviewed.
  - Patch 5:
    - Add mlx4_en_flush_pending_doorbell, which clears the flag and call it
      now that mlx4_en_xmit_doorbell doesn't (Mark).
    - Dropped Daniel's Reviewed-by because it felt like a significant
      change from what Daniel reviewed.

v2: https://lore.kernel.org/netdev/20261117155353.2250540-1-joe@dama.to/
  - Better cover letter subject line :)
  - Added Daniel's Reviewed-by to all patches, including patch 4 which has a
    minor change (hope that is OK, Daniel).
  - Patch 4:
    - Change the struct placement to address Sashiko's review. The new flag
      is moved to the area of the struct marked as "cache line used and
      dirtied in mlx4_en_xmit" and tx_dropped is moved down with the fields
      not used in the fast path since it is only written on drop and read
      for stats.
    - Update the commit message to explain this.

v1: https://lore.kernel.org/netdev/20261110231304.1859217-1-joe@dama.to/

Joe Damato (5):
  net/mlx4: factor VLAN parsing into mlx4_en_prep_vlan()
  net/mlx4: factor csum flags into mlx4_en_csum_flags()
  net/mlx4: factor HW loopback DMAC into mlx4_en_set_loopback_dmac()
  net/mlx4: track whether a TX doorbell is pending
  net/mlx4: flush pending doorbell when dropping a TX skb

 drivers/net/ethernet/mellanox/mlx4/en_tx.c   | 95 ++++++++++++++------
 drivers/net/ethernet/mellanox/mlx4/mlx4_en.h |  3 +-
 2 files changed, 68 insertions(+), 30 deletions(-)


base-commit: e20f88c4f08bc9dba09c48ddc9806015f79fb20b
-- 
2.53.1-Meta

