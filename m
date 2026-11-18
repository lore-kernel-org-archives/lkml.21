Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795026932;
	b=Breref0eP9sVG8ECQUlsqif7Lqcgk1gRZNgGZhGQKXZVppFRhZxPPbR9PHWbbc43XCUR
	 bFPfeRLg+UWuUfCYH/dbA9PjlSktNFNPxFgt5vWMf0LPyCP7sM5Zw2ewlXMY2Crmfryj+
	 2KF3bq65mksgNIrHgFG+Tdz32e+wGX1oHbVruNCW743UrmUmtHT4TgCCJgQ8OMRN0OoaY
	 4ZuYOD82GooYP6fzV8QPwfyZbqB41BI17FuThwBcdjE1BBs5CQldlUNz/Qc5MHyKHHAmT
	 Jz2Ljx+0BDIfzzMX3syUdSzDbOGuJwgcVo7XRNOQq1Yq6rCqe9emnsE0GEH4i2rFjzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795026932;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vurW6tbAJpm0OszY3dmHyuFaclayQrUJ/MbTeN4Jusc=;
	b=NJiX1RKhm2sfz/lURrsDV3OtKUI97XM1KwrhCpluUsXnlp/prQCF8TEP8ptImZYgyVSW
	 tmbsQJ26aElQVVxwgi68liyzdFNc6pyw35eBuPsbWVuzZ2fJOIKonwZP5Zb84D014DaJf
	 EqRhIaZvWSwD46UdluD1zrhvtGbGMWJh/MR8zfBWrJoMooDLgR/A4bdSn9itGliiiP4A+
	 Z8uMDZB7u4fh40VgFfxc1OkNNjziXPBe/83n2FwpqCxs2zHM0jPdk+QYrbRjcnIUmBB8q
	 Wv/sFxLHfeetiYNLapOKyBnOueWpGmLqsglf4bOVk447H8FM9l1m626ijGZKn/pJTAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AVsqmuBk;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C8E606A336
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 18:35:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57C8E606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AVsqmuBk
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso3169510eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 10:35:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795026930; x=1795631730; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vurW6tbAJpm0OszY3dmHyuFaclayQrUJ/MbTeN4Jusc=;
        b=AVsqmuBkIE+iASTOiLvKdYYsjK+y7ivJfFWXz2Q72VuJNkutNyDzOPFjOzdOlKDANC
         ruzX9z56cHG8gTqMEBNqspZE+KrNU/G5QF9ac82XSmAdBkoXBWgSTOYU/Kn50YtIonFf
         B/5BQVcuRzaW/q19DQM5wpMHcN59TL/mHh7TyUjzod1iorUhtcR6QOx7iSyKPKI0GUo/
         Rts3VRDpO/yteh/NnxXO4amwxMxenJD3oVw+yg8Cvx8oz7dMnxQIqcBDRCCgaoq+cVFe
         Yt+ftv4w24js7wrXMoAP2bz5sT+y9lVyTx32ZBUee6/Wbz++HN0JCqAprApytH3zWE+H
         g4fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795026930; x=1795631730;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vurW6tbAJpm0OszY3dmHyuFaclayQrUJ/MbTeN4Jusc=;
        b=YMuHMSTTebbj0wmnOOB8cPAr5FPvFq1QzOwRjlNLWqi0bQr6qfAS4mB8i8JzUFApFL
         EEwHKrcjBnm26E2eAEkIa/2q4Auf6xftWCO/DY3cStp0PoIjODcmJw8vtgVpHchqMqON
         1kdD+WTdtEzWJ1t2aKuam+w/re+t70QNGoH+uMFN/ekWGnXD2DnTYdpnvJ8FnKS6XaU8
         H4DmeZFaekyN5GwoKjyOwEUMUC/Wl2c2dqhvRbn4HBf+LRFAJQ7Nf/z3UqLuOZQlzbLP
         2mjnjiDJ5GBZMQgAx5hX4kiFY0R5sas9vaaCwdbkcZSU3S8MkuKEp/A/h/2jLh2GLLCP
         N/0w==
X-Forwarded-Encrypted: i=1; AL+hErEq/Q2o+tuaYfGE8DL/H1itjp9tR+9po6JdLlXnORGSu0cxFNKahnUUnbRJ6iBdgL/MBX6F4EUe+KLSdaM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8QPTTHIWB8uq+Iq51u40zngdV1EN7pKNDNQPCgogF/JqJ1nyEt
	DzJ6lSLdgJKJUmlkpwJ8B84OcKwGsWsVHlJ/dkI+3rqEzmdLuSuzGB39
X-Gm-Gg: AYBFou2LVgX3uqPGghzErrsvD4RNQiLzRuSrQLyIRK/ynSm2my46lIrdOF7d0tYh/jl
	mTPXNr7W8APH1G+en8EtDXf89CLtg7oqXju1oXdMBQ70yD6C6//CklfdKp9uR4IQMMJyrDUcaDw
	5OZMyodxUcPqebM5kJ55FWooVMqVgBSXEFrKpPsrd3PxG9A1kGEgG9EpPdFdQ5+Z3IYElyXf9ls
	+bgabpm2sebAw2i0noOsJnfRI2O4AaqtpVXiPWQ1ZuKZvogagJQWgbUMb3asamrXAwVacbPWONP
	G98ukyJPKGtu1L6CbWd8lxvKQ8o03i1c5/uWrgA7VuiHKnZKWKli3ewBEqfzYdIwwhHGypCFO3n
	VReI6pTBAJuA7ok4kuPjgr0I/CUHcUDcEICnhoUQi1kyUBfBrh2cit69sAj1QCnSfbzLlprgKSX
	2TUrEUXPAIO/Ds9tH+FGfPe7zSeYf2IKIbMwui1ou2lVtGRTCR+1vbfJw+lLGx05OZyRXTxQkUa
	WKif3zo7hyxoJCekmlosTowroqLvlQ7DDPop2+R+jeJAHGBJUfcbdmm7mnAQ24OWmqm4mrb8E1p
	NRM29NKvwuy9noGWzVoMCLTPfBy1lyoYCzzb2t3xNxR/eEMRbCo=
X-Received: by 2002:a05:693c:62c1:b0:382:1c52:da74 with SMTP id 5a478bee46e88-3828101d214mr3570600eec.25.1795026929803;
        Wed, 18 Nov 2026 10:35:29 -0800 (PST)
Received: from G7XWH7K1F3 ([139.177.225.245])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a45274aesm10450189eec.2.2026.11.18.10.35.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 10:35:29 -0800 (PST)
From: Zhao Li <enderaoelyther@gmail.com>
To: Jeff Chen <jeff.chen_1@nxp.com>
Cc: Jeff Chen <jeff.chen_1@oss.nxp.com>,
	Francesco Dolcini <francesco@dolcini.it>,
	Johannes Berg <johannes@sipsolutions.net>,
	Arend van Spriel <arend.vanspriel@broadcom.com>,
	Jiangshan Yi <yijiangshan@kylinos.cn>,
	Linmao Li <lilinmao@kylinos.cn>,
	Kees Cook <kees+treewide@kernel.org>,
	Rosen Penev <rosenp@gmail.com>,
	Benjamin Berg <benjamin.berg@intel.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH wireless v2 0/4] wifi: nxpwifi: fix AP channel-switch lifetime and failures
Date: Thu, 19 Nov 2026 02:35:02 +0800
Message-ID: <20261118183506.45749-1-enderaoelyther@gmail.com>
X-Mailer: git-send-email 2.56.1
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

Fix four problems in the nxpwifi AP channel-switch path: the delayed
work survives an AP stop, TX is stopped before the switch is prepared,
the work reads beacon data after the nl80211 request is freed, and a
failed switch leaves TX enabled over a stopped AP.

Changes in v2:
- Include v1 patch 1, which is not in wireless or nxpwifi-current yet
  and which patch 3 builds on. It now also clears uap_stop_tx when the
  AP stops.
- Patch 2: keep nxpwifi_queue_delayed_wiphy_work() instead of switching
  to wiphy_delayed_work_queue(). v1 patch 2 is the one with review
  comments; v1 patch 3 had none.
- Patch 3: minor style cleanup in nxpwifi_dup_csa_update().
- Patch 4: free the beacon update on every exit of the work, and clear
  uap_stop_tx when the switch fails.
- Shorten the changelogs and move the AI assistance note below "---".

v1: https://lore.kernel.org/r/20261028141819.7556-1-enderaoelyther@gmail.com

Zhao Li (4):
  wifi: nxpwifi: cancel channel switch work on teardown
  wifi: nxpwifi: stop AP TX after preparing channel switch
  wifi: nxpwifi: own beacon data used by channel switch work
  wifi: nxpwifi: stop AP when delayed channel switch fails

 drivers/net/wireless/nxp/nxpwifi/11h.c      | 23 +++++--
 drivers/net/wireless/nxp/nxpwifi/cfg80211.c | 72 +++++++++++++++++++--
 drivers/net/wireless/nxp/nxpwifi/main.h     |  2 +-
 3 files changed, 83 insertions(+), 14 deletions(-)


base-commit: 763b13f622e2758726e8e3ecaef819db8fa0430a
-- 
2.56.1

