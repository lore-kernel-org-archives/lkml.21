Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795059617;
	b=wwVUU+Hdl7PkzP1IKoYpbioAVFeFR5ISIAF2575tPeIxoscE2wMfdUgG8aUK/5QfeG/a
	 51PWQJYQYmQyvEIHXwzXtsP14MReB1QdxvjQrVQ1ONdKAJkKzVui31wTd5YrIsgVDS7Fc
	 DgaVF3v81wmdNmRsFj4AAQJObeK6694C9xAhZw9HF+E33c1ravNyVf+UzPssS73XTBvDg
	 SLYA5cIP/GpkVdWcheK0D0TN7IFuz+0pewWUiI4+ZRvOYqziS6Wsw3AEJDGiab5mk3MTP
	 iHrkgx85nWdyvNLPuaD/7V9b1svmcfqSqC44KKtHNabuhxuf7xYGGMSERntRzav68bA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795059617;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=15P/O4uHafhoF2a9GtiIC0oqae4Qc4Z1UYDUjewxzlo=;
	b=I2Rg8vXDOejDGVfsY2ZjkBXQ4ZS+lKy8jlDTF6TcOX5Pv07x08Z6rHC3rOVJw/dLkm4M
	 AjGetN7v8DwcF9KltBN1ULufuw0qnQXUGEJzM8BtmLI92hN4HEe0PhpEZOmNl355SsP+R
	 l7fHL6nk8/we4TDBYddU8qBsC6MzcQSA2XHlwBEL5GW0axxGluWgyORmWwGNF0sbBeR6D
	 QkIUKWObmWX+HvQRX6Ibkc5l4T5Onj4Ksx+/eG5I/ql5WD2fN6+Fep8xbangrp+lP1Wi4
	 vYFZNTEDe14CVt92N+cEJ17zCYWueCccFJd72NpgXnNT+n39GCUQCopwYdWBywCLDXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bJpBDb1Z;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A5F5606A330
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 03:40:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A5F5606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bJpBDb1Z
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so2529756eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 19:40:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795059616; x=1795664416; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=15P/O4uHafhoF2a9GtiIC0oqae4Qc4Z1UYDUjewxzlo=;
        b=bJpBDb1ZjnzNR0zWF3GNodwD9w6QcT20QH2daMX29Lp4R0Ms68oEtoY9mhcYq8BgkN
         PPzzwH04KcY/B6YA435soPv/+edVCvnh/oG7IY+h3vj+ikuY9Z9U2Lim5R2GZ2WqKLd1
         j1yh13Q1+C+z6SPgWKI0LFz8t9U3t+0N5ALCkk/Mgg/yrqzuZtFwP94cHO9yxKHNp088
         mBTiZU16lyKon1Fz/w/r4ZAczziP82vcXLYTAUp927uVSj85v9wcRDEVqvCXvM6bSE2m
         k3RuAILDjQm5LEP69uQ/TL6FrTCIuOcrw/U8+ue1xRYa4KR4kWnv0xRp6js23NWfH0Tk
         moVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795059616; x=1795664416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=15P/O4uHafhoF2a9GtiIC0oqae4Qc4Z1UYDUjewxzlo=;
        b=NOH+weiL/kd904fgGitBCW023bv4YJjx5CkVYNlqchprAtQeg1CQU+1cBIcMh24636
         xYrwS5gmJQfbLZs7WfwB33zla1Fl2PuXfUyNu11aR3q2JhgR/eeHyxMSBCB5w28mAGqi
         Tl10aQBllURCxeCZC/r/iyAcFuAY5Qqz0Sxzw9JxKogg+9koyIiEx66qUpQCrdFQCdPQ
         eWw4YPsd3k2o/55/ocmDRNDRnQCxNqaf5vrpGL+4xDl2I0PnfUCbKEbUIwqAfvFO92zf
         vYwkWkcZV60ACkA/5Rhm5QQ15VAOHL3dAARXrDnmsc9Z4370IjHNCQs/5u6hbkkq2KP2
         2ghQ==
X-Forwarded-Encrypted: i=1; AL+hErEkZWX+2wYOJGdIOV3LUYuqbBRYPdeU+bSy0TAz450Tif0mYMCtCaKRXZfiyJJOs6Kkw89a6Pmu6Eur2YY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/j5OiDneyEyPnQlcXuEVcje89XLOHHq8mK+/cvf+iQwbuPDabM
	rU17n6tabO1kT2lL8Y5Wvl/ZBWdcZKTAcput+rQStBfdqdPWg3vfhr1D
X-Gm-Gg: AZFdTZceRXX/X9ILWkwY6WtRXpv0Fvifv+on7v6GOMaOLLpH3afag20+43LI1dHnnVQ
	xwv4oGm3PrwfKeXkc7ftGIxurY/E67Gc8z7kx8WdR3sfI9LrpLN9gMP7BC3MbYBUBD6iV/XwkP/
	wsIGZgZS3agR57ajkLZ0pJsjgBunQlnFVNYhKXtZNT8v9srDqYql+8nvWUuusDpSWE/zZ/HFCae
	cXWQ8xJ/sRBg30NM5YBQbw8wy3fkfeeIc5iVipHACjXj5RN9aIRlBrrrwAwJQbdXFo27i8mhVrG
	YnQhGhjKz8+aEKtU1wR4wbrABn200MCZwB3un/aanQiN73BZrSy9gKS+JhMGjX/pJsuNPgVX9pL
	NeFdU1WCf3aHX/utnz9RA/lelyXhdYJkw++4o7Jk1OV+rjrX+0LWHUAlX0PdZQMw6LZuY21Evfc
	GyZT3N4ZImGemc4vXvFxpD0OnkVWWTeOdnhBblueVPZJgSXnuVytqjupjYRwrHMsEWPFUorZsox
	myFkikYpXgOCOrWV6hMHs5eyvtfa46rthgG3Vm2DupdSu5SyUskrtP+eG5HQAigSmhnQB/2/bnu
	p2l4elddlVos1+IJZmzBaH1al245b+05kw==
X-Received: by 2002:a05:7300:f0c7:b0:35d:4e41:d2c2 with SMTP id 5a478bee46e88-382827a7e7bmr4334711eec.33.1795059616249;
        Wed, 18 Nov 2026 19:40:16 -0800 (PST)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a4522829sm12699465eec.1.2026.11.18.19.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 19:40:15 -0800 (PST)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Christophe Leroy <chleroy@kernel.org>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	linux-kernel@vger.kernel.org,
	Marco Elver <elver@google.com>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [PATCHv2 12/18] powerpc/pseries: Annotate the RTAS indices sequence lock context
Date: Thu, 19 Nov 2026 09:09:07 +0530
Message-Id: <dc943581f34fef51bac658bf9495e59bb56e54d7.1795058683.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1795058683.git.ritesh.list@gmail.com>
References: <cover.1795058683.git.ritesh.list@gmail.com>
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

Clang's context analysis reports:
  papr-indices.c:145:1: error: mutex 'rtas_ibm_get_indices_lock' is still held at the end of function [-Werror,-Wthread-safety-analysis]
  papr-indices.c:158:2: error: releasing mutex 'rtas_ibm_get_indices_lock' that was not held [-Werror,-Wthread-safety-analysis]

Add the necessary annotations to indices_sequence_{begin|end}(),
to fix these errors for enabling Clang context analysis.

Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/platforms/pseries/papr-indices.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/powerpc/platforms/pseries/papr-indices.c b/arch/powerpc/platforms/pseries/papr-indices.c
index 3c7545591c45..3f3b88f708a3 100644
--- a/arch/powerpc/platforms/pseries/papr-indices.c
+++ b/arch/powerpc/platforms/pseries/papr-indices.c
@@ -126,8 +126,10 @@ static int rtas_ibm_get_indices(struct rtas_get_indices_params *params)
  * indices_sequence_begin() - Begin a indices retrieval sequence.
  *
  * Context: May sleep.
+ * Returns with rtas_ibm_get_indices_lock held. indices_sequence_end() releases it.
  */
 static void indices_sequence_begin(struct papr_rtas_sequence *seq)
+		__acquires(&rtas_ibm_get_indices_lock)
 {
 	struct rtas_get_indices_params  *param;
 
@@ -150,6 +152,7 @@ static void indices_sequence_begin(struct papr_rtas_sequence *seq)
  * Releases resources obtained by indices_sequence_begin().
  */
 static void indices_sequence_end(struct papr_rtas_sequence *seq)
+		__releases(&rtas_ibm_get_indices_lock)
 {
 	struct rtas_get_indices_params *param;
 
-- 
2.39.5

