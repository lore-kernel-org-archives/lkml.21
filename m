Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795147415;
	b=4gUG7EMM4f5ICtWtzRQmTeg+NuD176AnGuEyENYQmIEDWBAZgsP6h0QTpRuvyuiltDt0
	 ApsAqkoqtA7flT6g7RCSUZeAmQAONzQegRxmgdFRhpXpqC3HiT3HqP8DjieJJqOdjrtMy
	 nA3eG+uiDPIrsapXmDZn/u0FxMApB6Rl2hBN9nBHrQu4OJq+5Nk4gLoU0u8H88IbLeXi1
	 4oNuzlfLBbHda7o1uprbQSeHl/YEQFO/LHUGqQMWXmjSrCOqm7Luj/w3H/iuQA0agSPzb
	 Rp3AwSDMxaduRtuy+L30UiLfCj5wI7AavdQwaeDESlggIefqoxVM9Par4NWTTj9TZtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795147415;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yXYdj9nyuM4v8jiGLwhF31o5qWrZcD3zaXor3EN0gEE=;
	b=BOqwjB9d1JWOlWHCr5JAE36n6EMnHG7bwdoAo/G4lt39ffQvHw41hzGZv9tvlVTWLMME
	 n+EM0VLSpKeL6auvVQCbexd2XiOR7j/p5QhbvCI4W1zoHuJuopisJZ+6CaiV1zg434hWK
	 CFwkArL+MKj4dCDZBIfNm3cKBHbG1VNkpADeWQctsRd4MyT5BLTFpNWHA6S0iAMKLLc6E
	 eOAXvCcqHTdFleZusIrhi6tz3Mcj8egjKcLAqUTS2fKGqYUk4aQ3y/nzyt5xtr5llZPDW
	 2dIaH6QNbbWQWR0auC3YZzzn/4rNbzGv73T/Bbh/I/7VWIwQcIB4wdDfmMKKLPTX+lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0QMy9xVi;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B08606A331
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 04:03:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77B08606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0QMy9xVi
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-385d8a00598so230618eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 20:03:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795147414; x=1795752214; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yXYdj9nyuM4v8jiGLwhF31o5qWrZcD3zaXor3EN0gEE=;
        b=0QMy9xVihzdqUeuC2tXf4jH6W6ojo/2tnNh0uAc4vUeSpaPgFdS6xiOpbsBHSlt0mg
         Yay4agX0tWmBpJH+LDsY8JPSD3DdwfTDKyi47L6e6U/yJffhpv4hAtU1c0u5CH+WRZhJ
         nCmYSSWnii/9995khh1tO+9eCQyaA09F61WuVQrg0f+FnK3b9RAYu+Si0dw9ezgBkHQ0
         sKxszHEFuTvPRF8GIUT3R2TsXRtvmFnGp5ZDfKTCEcu0dJ1mPQAUqzuTyL5/G9wwh05n
         2tjyPqAVrahlL2iMxNED5I4y1Jh0O9nO6Kpf0+yFnvD4+jXPXaXc0XQUbNd1ugq4GLJM
         4bMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795147414; x=1795752214;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yXYdj9nyuM4v8jiGLwhF31o5qWrZcD3zaXor3EN0gEE=;
        b=zmNanCvmCKHDOK+woFpdXjNwL2oaY+vKDAUxangNUnqLsPSbDUbba3DDhcF+95tZGB
         nlgvqJZYHL3I3j4aujbqsdMn/z/GbTRaKvfmE5NiG8t/n3vrDK+sSa11spFMba1u5YZ7
         1pBX64W9xmkdN36m9kQoycB42G8ep8hfjqkumK3Bl8yUlnU2Q6C3RtIV6vh7mSFswLze
         pW6c30CjM8RkAnTHz+y73g9B8Tcd5zTnNCocpv8xiNbLJJEUJEW/Jjv51CaEoyOU78MD
         WAdt+3y/vDezqeDoz0hAIPYMH6uCiUMwQQn9RKI2gb8YT5sR/2mvAZ05gquPbQUtVZds
         7vAg==
X-Forwarded-Encrypted: i=1; AL+hErEvApG5JGfEEkcwdgtAnbSnxJNhFqxfiXeK3sKlk2EueWo4lMFhxRK9cJ6b0pIUcWJwNUqOj7Mig28AVTA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+KJFsQFRq7WRiEQVPnKhF36FTXYM6a1zKpX2jxeXqUqs+enJCt
	W7KuDMpyCTkpH+2GKzD1GJgxiua0qXs2Ae6kMTgrozL02vFQJM9x5sTo
X-Gm-Gg: AZFdTZeVhUc3sOg/W9/nQjBJhCVGLgobGh5nO92wAHPPp1qX4AHHHuh1af5ftLeM90D
	7uX4Io+Qdr9vHK1jkZptIG0d9SMVKCinaeSD7nN0uqf/2t/WuVLesIbNc6rWDYSJc89KNiI/p9R
	OT5dAX+rAqtBnud4T37IpznWdV2PJ3xgFCtrk7HXgwNPzXFbxiKq5Y+/MJkK95YYKRHH1Xw+rhv
	6HP1GAPhUikYJkC5KWMW/kEffL57Y28kq8QoZd+01RiE/stPe3y/BGDutUZBbm2V728/aGCK7iJ
	ePwBpcvRhMN22wBU3RwGwAEONX3uI5veULNMdJo/EA1E/YLyxUz3Qi/8vii0bY8vtOUVo0anBEK
	gEqK97gfQCaDVW3SxioR/+sHSCmn+O99BxXtR0hcfYLveERgxNnJYkobBmYcZY8D/mW6N5N7aj7
	9ije8XcCUYkK9wex4D0Ah3am/F7ql+4vm83EyDwS2Ag6hM82qC6SJ9LOGNGNu6qxluQUcrXbrYB
	5zYOG24d19UgW+9PiDyNR2RNzgWaAYAZ2to3UAVxtJ5vnZ93IgSjhdwiOWIHgPU7WjhREVA4lY8
	lKJnOrGe1sJQhFxeOjwiOdRC1WYOPI+rqw==
X-Received: by 2002:a05:7300:10e:b0:385:4fef:bb1e with SMTP id 5a478bee46e88-38570c361e8mr1625006eec.36.1795147414494;
        Thu, 19 Nov 2026 20:03:34 -0800 (PST)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7f59sm3246104eec.6.2026.11.19.20.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 20:03:33 -0800 (PST)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	linux-kernel@vger.kernel.org,
	chleroy@kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCHv3 01/19] powerpc/mm/book3s64: unlock RCU before returning from mm_iommu_is_devmem()
Date: Fri, 20 Nov 2026 09:33:00 +0530
Message-Id: <c6cce4c4ad2b177cacfb7bfbb7bfd4a26fcd4612.1795147055.git.ritesh.list@gmail.com>
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

Clang's context analysis reports:
  iommu_api.c:380:1: error: __ctx_lock_RCU 'RCU' is not held on every path through here [-Werror,-Wthread-safety-analysis]

mm_iommu_is_devmem() takes the RCU read lock to walk the preregistered
device-memory list. On a match it returned true from inside the loop and
skipped rcu_read_unlock(). Hence fix it.

Fixes: b5952f8125ae ("powerpc/mm/book3s64/iommu: fix some RCU-list locks")
Cc: stable@vger.kernel.org
Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/mm/book3s64/iommu_api.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/iommu_api.c b/arch/powerpc/mm/book3s64/iommu_api.c
index 60d00c9e7f19..56d9aa6cc8e2 100644
--- a/arch/powerpc/mm/book3s64/iommu_api.c
+++ b/arch/powerpc/mm/book3s64/iommu_api.c
@@ -356,6 +356,7 @@ bool mm_iommu_is_devmem(struct mm_struct *mm, unsigned long hpa,
 {
 	struct mm_iommu_table_group_mem_t *mem;
 	unsigned long end;
+	bool ret = false;
 
 	rcu_read_lock();
 	list_for_each_entry_rcu(mem, &mm->context.iommu_group_mem_list, next) {
@@ -371,12 +372,13 @@ bool mm_iommu_is_devmem(struct mm_struct *mm, unsigned long hpa,
 			 * and the caller needs to distinguish this situation.
 			 */
 			*size = min(1UL << pageshift, end - hpa);
-			return true;
+			ret = true;
+			break;
 		}
 	}
 	rcu_read_unlock();
 
-	return false;
+	return ret;
 }
 EXPORT_SYMBOL_GPL(mm_iommu_is_devmem);
 
-- 
2.39.5

