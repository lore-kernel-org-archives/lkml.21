Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795052692;
	b=HvWcjHouKfETmsAiXw+N+JqA72ISfqclx65QLWeSTNIg3E0cbWqy8y7eZ0GpEnUada+P
	 XhdfkpfioLSOAZ0yvba5B2JluKNURfUBpGT/JQw6nebVTdn6AgWmNXGCdSrnSsBqN9nSn
	 nRIzqqPYq82+ZlgNCHCUopCU88heXFpZOpbwnpr32dRb5CQT+ODU+hAq2WeMdZ93byNwh
	 tmoDNYgFV540PtgtBq2XVyRrTnbRx6pQOFisJnDM7HTqAVJDCxCUfyBIh+gU3DRcjRuwZ
	 uvx3g6KLZYlVh5qfRhTxeAXVzaSZQeIL2hHM+2ebECT3GWG+j2X0nmyJtNpgogNmuuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795052692;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=v4lW71hqhZbV5kfSIsvoYuUxtKOMyzQ4eCZONwiwYEQ=;
	b=UadyiP7FYQqeKcfgFUCZbzi5rxPzRdQVIfbpkI+u2NOLrn/GHyYoA1mxCvNfwebcbZ27
	 aZwzZet5nVrEVuvxXVnltZTahGVvf0Dd51i3tqk65iMSTQU3vagRkJLLG1S7b7YgfnLcK
	 5A1gqxcUJ4ZIJCSgV/Nrq3LN3sFHPecHK26hPZKbYZH74ZC0oVu6J4JIgOdzrJp5TwD9A
	 WMRy0lcaOjlVZXVBBMES463Y1lcLGOoIoHlQFDnFwO8n02XazM7PgzIXsWM5lE29HCtPs
	 2Qh32ScB5MjRY6G8p0dr8e5etcWoN77lRc2mVFFUBwZzQrzpjfUVzg3ZB5SyMJ9hcvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0S5Fq8xv;
	arc=none smtp.remote-ip=209.85.222.171
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA7C2606A332
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 01:44:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA7C2606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0S5Fq8xv
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-94960131b30so193287585a.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 17:44:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795052691; x=1795657491; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=v4lW71hqhZbV5kfSIsvoYuUxtKOMyzQ4eCZONwiwYEQ=;
        b=0S5Fq8xvdzdIyGOtuLcujzR3VZkCAAfSEBhcw2Uj45F3rswz0rN0S5TE5UNZsMDV1G
         mYhv6qE9hhHECJmdW3UkAngZptulFkzxB9rLC1EAvOnGETQxrEboLplcMoha/Wkztygy
         JMJszfsqhqBiHQkcGiVmql01fGBkHG7oOotwdKiFZOwyXJ+OWVhyw6IrWyDrUWu7a7At
         BBJJEXzDFIfdysXUZ3ukohqjEFRjhN8g7vcG/qEjZ1kR5s0Iax93Uk1xzH533qRYm5XY
         EZjro7eMJXe3BxrJZjyNzIjC8a5QHO293/2nsLV7DoxjSI1LG2kYjTxptk0SYxmIR6T6
         S8RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795052691; x=1795657491;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v4lW71hqhZbV5kfSIsvoYuUxtKOMyzQ4eCZONwiwYEQ=;
        b=ad2scdIg4Q5AIBYCTzbBQWQSziQufCAv48RtuL+oEoIHR0lWxpRYMH+7elCurByuRC
         P7IBFulK6BptIRu8K4RUQW5kSQlAix2tjz+142nkkzD6CD2fdmv78eW3Djh5bgD1NOKs
         fnTNfuCpAHlfFZNqYLWd+HreuIBmw1B7qYBi9nNHibeAPg0oSdsrc6/ItbqABb6QTFW6
         AQqpgt9Vn2STqhr+4+/Pfqe1PSyzrOcMSvABI+gdYOfXBGppli8Fy7mvdGPPZwhS+Oso
         ZUwlD83ilPxTFmTfyZ1E8qT7ba8wVCG/UG7yQB9T4HKDtSCoRXhidLxyyIjkqsKaYsw/
         4YrQ==
X-Forwarded-Encrypted: i=1; AL+hErEjuc5oBcZeYxvdTU4wVr5aV/UMMESFMqn5XP3sIHWaEw4pToWigcQ4Ew/CVlZnwcqTP2ydWKb9lglxn5g=@vger.kernel.org
X-Gm-Message-State: APuU4Z+FEILBTG26j3xzPr6+2AqsNc/tBH9FPwCiaDyzOUzgw7bxvDA9
	NIMgXNiT1VBWjrGXoSS2DNsQZ99f/SvBlB0lbP1gYT6y+8pN/fdsfig1
X-Gm-Gg: AYBFou3Tc/fCnOSC0ebfgH8YBUC7KavNzN/vxQlTd7wZIBW8Rx7RxLtCpoJIKFAuAVc
	Z1ZAxWKEOvK60WePibuI0WmixkZtk42LQomCkrhfpxupryMvzL12gBIksPDDWT1fF1WhaaHEDsN
	z5F4m7tCkW2FHhaXwCRKJBEDPiIUtX4APZ7fJLhtE26j5oK6Z45GpWTxs/oM81f5BMvKVij1EEy
	Ceeo/EXyg4aHlhgvmnU1lnV7XrTHi2nC6DVOfTSW5+Njv+Xa30pmVgLyoX2riImOZcJywnI+sXm
	hWvl47GIYoq8mT06l37RZVEwpv1aR5Y4Z0aEpWjiOEoXQToR+YAI1RgGFDSSe4lppfz6/k0zZa4
	FSL83VtihlWxaABWHoVVOwNTQ9b6IAhoavn2b3Pi/jQLi/FPehWo88V0U0rxfo7duULxuEbqEqb
	4Eo6mAJHual3AOzwgo1G2Z/ZTATFd2T5bhlUFKJXEpeVEJmd4tSkusVTgk7rjQuiXa52lgB7N7u
	u+KhXfqk49/24bGfvP+q8jJo316CsTI2RGLAhmSO0++vmv9pFwEluaRyBKJ+g27RLk7ursK8y+P
	HgUwlJGoAl8hGK+p0pagEWAWFSfdOvRSKAXigsRHC8eBXpgwb4lp0Bq6MgAFA7QxMxpIavS1rvk
	=
X-Received: by 2002:a05:620a:258b:b0:93f:3565:813 with SMTP id af79cd13be357-949994af05cmr800463785a.9.1795052690762;
        Wed, 18 Nov 2026 17:44:50 -0800 (PST)
Received: from linux.. ([8.34.174.240])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9499b743a8bsm320302485a.17.2026.11.18.17.44.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 17:44:50 -0800 (PST)
From: Changyul Lee <lcy8047@gmail.com>
To: Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Larysa Zaremba <larysa.zaremba@intel.com>,
	Simon Horman <horms@kernel.org>,
	Michal Swiatkowski <michal.swiatkowski@linux.intel.com>,
	intel-wired-lan@lists.osuosl.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Changyul Lee <lcy8047@gmail.com>
Subject: [PATCH iwl-net] ice: protect VF lifetime during LLDP configuration
Date: Wed, 18 Nov 2026 20:44:46 -0500
Message-ID: <20261119014446.577784-1-lcy8047@gmail.com>
X-Mailer: git-send-email 2.43.0
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

ice_free_vfs() can free a VF or its VSI while ice_cfg_sw_rx_lldp()
is configuring LLDP. Taking table_lock here would reverse the lock
order because ethtool already holds RTNL and ice_free_vfs() takes
RTNL under table_lock.

Look up each VF by ID to hold a reference. Hold the VF's cfg_lock
while configuring its VSI to prevent ice_free_vfs() from releasing
the VSI during configuration.

Fixes: 2296345416b0 ("ice: receive LLDP on trusted VFs")
Signed-off-by: Changyul Lee <lcy8047@gmail.com>
---
Found with a static analysis tool we are developing.

Compile-tested only, with x86_64_defconfig plus PCI_IOV, ICE, DCB and
W=1.

Taking cfg_lock under RTNL follows the order set by commit ae82ccd68774
("ice: attach and detach VF representors outside of vf->cfg_lock") in
dev-queue.

 drivers/net/ethernet/intel/ice/ice_lib.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/intel/ice/ice_lib.c b/drivers/net/ethernet/intel/ice/ice_lib.c
index 773a656ba92e..4068a1aac8e8 100644
--- a/drivers/net/ethernet/intel/ice/ice_lib.c
+++ b/drivers/net/ethernet/intel/ice/ice_lib.c
@@ -2207,7 +2207,6 @@ void ice_cfg_sw_rx_lldp(struct ice_pf *pf, bool enable)
 {
 	struct ice_vsi *vsi;
 	struct ice_vf *vf;
-	unsigned int bkt;
 
 	vsi = ice_get_main_vsi(pf);
 	ice_vsi_cfg_sw_lldp(vsi, false, enable);
@@ -2215,14 +2214,18 @@ void ice_cfg_sw_rx_lldp(struct ice_pf *pf, bool enable)
 	if (!test_bit(ICE_FLAG_SRIOV_ENA, pf->flags))
 		return;
 
-	ice_for_each_vf(pf, bkt, vf) {
-		vsi = ice_get_vf_vsi(vf);
-
-		if (WARN_ON(!vsi))
+	for (u16 vf_id = 0; vf_id < pf->vfs.num_supported; vf_id++) {
+		vf = ice_get_vf_by_id(pf, vf_id);
+		if (!vf)
 			continue;
 
-		if (ice_vf_is_lldp_ena(vf))
+		mutex_lock(&vf->cfg_lock);
+		vsi = ice_get_vf_vsi(vf);
+		if (vsi && ice_vf_is_lldp_ena(vf))
 			ice_vsi_cfg_sw_lldp(vsi, false, enable);
+		mutex_unlock(&vf->cfg_lock);
+
+		ice_put_vf(vf);
 	}
 }
 

base-commit: c2c187fd5fa667cedb0b946f5f7a5099fb8e8402
-- 
2.43.0

