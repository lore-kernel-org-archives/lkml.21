Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795147423;
	b=H9JPnz9k9SKYi9/FYyH3at6Rd9zBIOmdobTdljmB/b7/JKaYbMr24S+BM7BjAyXzZKT3
	 rBbj5xnfP7xpMVS/gUcXciFY5WJqnzV6Mi63GDC/j6VzxdGQ/vAoRj4+mxHtyoSb7wiAc
	 UDfGhC0GeIlpnqnwGn+CUogBQdTbqZXBjgT4sL2CAXSATQewZWh/NwCmsr7F0s+YwRYep
	 nFQjOKqIJGwH124U5z28GfWkNrw+Vkxa/0nKOLQ4MMK2CHxs8I63X0n79F5C9yKrs9LW/
	 U8T8L5Nk6wDoRNWgwahtag7cKRzEPi2ckfuenGhM8LsR6OMNdcg2yzhk6mDs9PIoYaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795147423;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=F0IcenKlGXfs/ekHbNQmyvDTyrNd0+ZA/lq2CB7f/tA=;
	b=FEVqTt05vtxMRg7yeZp5uWOnAUPWS7LiSQ9TJ90rfnM29LrKV+LGLGSTsXW2vS07SMro
	 OCVi/jD/v9NiWd7axdRyoJuVtPxip4Zm7kQ0/1IjVRDM/5ciTZdEOSbqR7Ja+iuXqoP1b
	 ABw8u/qGCFaxvIA/DfI0VJ8896VLH5AUa1Gwh8s1Lla9L4u2sWgNohqyt18b+its+1WES
	 2lRFtpU6B/KVbE32KwK0Uy5dsHmK3mhjPxbotNCCd6jDnrwkgJCKL3EJruCVJt6dvg8NL
	 yuk8LeP7xTp9xBRzP2PY/yBpzflLIV539ypGgyIz8BrFeQDYOPYEgpXfLATgdw96u8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rcRifx8w;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77574606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 04:03:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77574606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rcRifx8w
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-385c497bf94so497010eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 20:03:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795147423; x=1795752223; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F0IcenKlGXfs/ekHbNQmyvDTyrNd0+ZA/lq2CB7f/tA=;
        b=rcRifx8wHHBW+RonQfAvZljv/U20KqrIc6dDiyuaXmOLbl3eGFuchZ1TRKuLw5ey5E
         OzuxzSB5wrYfj+25xlFhXYXlpoq/W8sXfCW4ODQw8ue2T6z2EQUhevKwasW3xKlRkbPY
         smRDMsqH0FhTB4sNkaoh16jVYmrFCo6UvhgVWtqlvyZxHI0aKzdLC1XdQpHNrQKjq0iB
         yzu8s43R6yXbmuUgAj+wdXcT8rEiqDA/5m6PM0pWzF3s3IzU9V9h3+5pxbEqKPVfxY4W
         lFO/cUSBm+I3B4PeEcAxXzPQJGQhSlhAwL3FO8WouPofM05M/rIfYC8RGpfQh4GJQcAm
         FQBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795147423; x=1795752223;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F0IcenKlGXfs/ekHbNQmyvDTyrNd0+ZA/lq2CB7f/tA=;
        b=zR+RRys2kldmZ5WT9ChBGaEVximKA+7mwsAYoJQ32u4JQ+A9edVifmRQhhZYidF2Lv
         AevhccOi/40SDjRLCRiCMSGZgpngRDSy5/8XRuqy4/YlU5MSGGWFn9NXfVKwakNhu5y0
         0tBeSs6Pgbduw61P1Pj04/iohCV7BY5RgVLzYh1wWpZANwPogNpWHAn+pFaUie1CiwuP
         nUfjGi8lpm/Y+yvhaLXAlgs0v0or0hTgiLXqd6CE/npVy5h//MPvWpwKfIoJ+U6kOB+O
         aQBd1KFpwcOpkfPaU36LK8YmZUFmHU9KgG8OP1x6Q5n9AulodMrpQbe9m6vP0R7B0MI2
         RZhg==
X-Forwarded-Encrypted: i=1; AL+hErHF2edlmVKWSsd3RkcOIN/7nELC7Oy/DATnZ7dTNB6UJ8ClmQxg4YO9QPhv+0uAXD4LrGfw0sSR4AThy/c=@vger.kernel.org
X-Gm-Message-State: APuU4Z/1r9Alw0osuWPuYtB65SXLWliskMo0zgcsT3tBBxRxaPuMrk+W
	k8xpg1u2B/G2+jb5q8TWl1vFpWKHKnDJmuFpZbJdD4rWW8HoEpY0bvSS
X-Gm-Gg: AZFdTZdWxUjEQIDbiHziT3zgkLr4l2sqAAJRMlYbzgIDUWEilxACEZjEm5GJ0jQfhvA
	bkm3RtnOnR9Eadmyv0nic81/QWkTcZj2bxxbCp6M+b5CG749xps5T8NVIeV/Z+TSUcACB3dnrXI
	qEsIzyU3dBUFxPJHotUcbEjc+L8YFnXtU8x3c0B8kYDVxHYoT4FRxePiFwIwfo8QBITNMKkNlKu
	fvE8IcJuktmwyFMP6GWyKibAdeBXLvRR72OKtkkYzGvCujXpRxmpfrYaGRvoVcI/oYze0XTEScv
	6DrB/H21Nnc+5MMp/UNBOTwp2XgC67N2Wk40XcmDzHuTSuYrcuyOrSKuUQWA9J+NXsAfsJ55TrJ
	vuEf7wJg1cR3OexaItmovV3+fEXfACZ64PrzhOHBIhqGSb68KkBcAnmxKugW9r83vEg1tGBB9Ur
	885vzFLP2u1LamTKx3sIUM6As0NIWigc2Ca69UXqnsiWlD/W7C8uashGWfkfnO4PzUnlkYagkSU
	92y0IVG79OBg7KuBgPmHI6LmrpGMCs7+0qcb3Q2HJrRCp3gsGO0I/KPiE/eAgE62S0wVQAlS0mw
	w/3YHDncAm8KOikyZm0olPCNqRfGnlC9iw==
X-Received: by 2002:a05:7300:108:b0:375:50d9:474e with SMTP id 5a478bee46e88-3856c0d0bb4mr1846178eec.4.1795147422638;
        Thu, 19 Nov 2026 20:03:42 -0800 (PST)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7f59sm3246104eec.6.2026.11.19.20.03.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 20:03:41 -0800 (PST)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	linux-kernel@vger.kernel.org,
	chleroy@kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [PATCHv3 03/19] powerpc/64s/hash: Reference all arguments in the 4K pte_iterate_hashed_subpages()
Date: Fri, 20 Nov 2026 09:33:02 +0530
Message-Id: <3557ef0c4ad63a904f57ca2108757c0cb72eb911.1795147055.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1795147055.git.ritesh.list@gmail.com>
References: <cover.1795147055.git.ritesh.list@gmail.com>
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

With 4K pages there is exactly one HPTE per PTE, so
pte_iterate_hashed_subpages() only sets index and shift and does not
look at rpte at all, whereas 64K version reads all three.

Reference all variables in pte_iterate_hashed_subpages() even for the
4K version, to avoid -Wunused-but-set-variable warning.

No functional change.

Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/include/asm/book3s/64/hash-4k.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/powerpc/include/asm/book3s/64/hash-4k.h b/arch/powerpc/include/asm/book3s/64/hash-4k.h
index 8e5bd9902bed..179181870e71 100644
--- a/arch/powerpc/include/asm/book3s/64/hash-4k.h
+++ b/arch/powerpc/include/asm/book3s/64/hash-4k.h
@@ -89,10 +89,14 @@ static inline unsigned long __rpte_to_hidx(real_pte_t rpte, unsigned long index)
 	return pte_val(__rpte_to_pte(rpte)) >> H_PAGE_F_GIX_SHIFT;
 }
 
+/* references all variables to avoid -Wunused-but-set-variable warning */
 #define pte_iterate_hashed_subpages(rpte, psize, va, index, shift)       \
 	do {							         \
 		index = 0;					         \
 		shift = mmu_psize_defs[psize].shift;		         \
+		(void)(rpte);					         \
+		(void)(index);					         \
+		(void)(shift);					         \
 
 #define pte_iterate_hashed_end() } while(0)
 
-- 
2.39.5

