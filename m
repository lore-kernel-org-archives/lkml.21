Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795441932;
	b=llpKLugNOve73gUsgGQdWEILPmXme3fMTG/CsvhBGMugciuMs/mdBaHWvw0pF1vBxVxb
	 igrDeP+ARbLrib6KabBz+d0MbWfNojuiE86wKag7onHMtmzKNgW9hS1uYZp4niX5sa6EW
	 EEI8MpjTqWZhBzV4gd3aK5wtqMiLCeT1NRLfMtx7C0aDtqUDK53iEF1gANWe+jouMxM7A
	 8M5bZd0hI086gAbBsM//gU9nKZzjIJU6AMSKgnCb9dvORs3dELhTG+Z6iGpIolmeqji26
	 ZtgLJfAfNukT+a8f32I7Qe2q2uecMzMdsLINLZ45IPFqkez3Og0Zhz3lciQYsJ6TyuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795441932;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=t3XbpV7aE8lPEF3WjasnioB+LmUiUo8YbJQhUQP3FUk=;
	b=QlGpp9M0mwdtSvjBpLRupVdzgXwUNpsmoCejI6sSba1RZlg/oPDufEFk0eoDTznFO7+n
	 qGvlfpyVi2XrAk1tYR2+LWSHKLcdqkV8DSQgiAKGSOpNmMurFE4b6ZCHjsJjt6sEakpqA
	 8uyFP+1DYKvDzkzGtKgqTyI6htvxX/nVl7u8ELtwQMqWGcjVGEOWnTY9v5LJQMFxWLLUI
	 XYr3AmmynBOKTq5CUbvXSiTMVbtwBnZrltbRE8cr7ObDKa30MDaALemSWBD+WvXKfCxtI
	 JI+n7F2sYN1y9zhZnhgxEmrp2Qu3qj3lZFIh4dfMyba5HWqTPYwtg6x6vg1fcb7kh9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ionos.com;
	spf=pass smtp.mailfrom=ionos.com;
	dkim=pass header.d=ionos.com header.i=@ionos.com header.a=rsa-sha256 header.s=google header.b="RbfSu/x0";
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A36C606A687
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 13:52:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A36C606A687
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.a=rsa-sha256 header.s=google header.b=RbfSu/x0
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bb85e07aadso40560125e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 05:52:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1795441930; x=1796046730; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t3XbpV7aE8lPEF3WjasnioB+LmUiUo8YbJQhUQP3FUk=;
        b=RbfSu/x0bDwJHK4flElPnk1iqilrNXrIFmDpp8JSLeS0nOuRHwXBkrEGvEsHiyIjRT
         N5hTJC5fNWPiCGSQpzNXqDsJa2II6qUe8scq0sApwJm71mSZaaTmYe5IDh9JexBg5ITm
         /Ub5Ixyc1yGS9Q2VA0OZX4nVRTpExuGwOoAaQt6G+WGKh37/8XCxfKpzuevzTiNZKXCw
         clWXXxtiTYnGfgPafZ4vX1bkHqewPW/LhO05hMUGQkiyWv6X0e7G4WHIzMORyNfLZ3x7
         RuOz3Y4Vv0/02LPT9GRCshSaCMAQFQ3RFEHEGGkdx5zQ0yuhB/UpdekyELB5Z3TNsdb3
         qldA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795441930; x=1796046730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t3XbpV7aE8lPEF3WjasnioB+LmUiUo8YbJQhUQP3FUk=;
        b=09M1ZvhDEDTPI4gWYdMRKr2TXkFMcD+GKLlaSnNHo3i9SQBEpDi25B3PEWBDWlsn7l
         yC/OJ+EOYSFXU4sjN6aSfa5HtvDOSeOAZvxXbzBU0R7FAUi263EUPV5gKaUxL1KEzoFR
         4o94HPFs81h0A8Md6qx8ebwbUwV0FiMw8s/lkplF4NOhpnvc+7BrCowDFGtMs1gNUR1S
         WmmJDTPzFeHQEbno4L1U4J0y0ZIx+N8Y9WuL8WqUNxQO3hPN74VVSKbiy2Icay4TZjBv
         icQ8a8o6KBVJ4MmYP6GIDekuSpDHPVNxkDJDmgiop0XYlLgSPCaQxw1H1Z21trx60ZMy
         9Abw==
X-Forwarded-Encrypted: i=1; AL+hErG2+yaaPSisYvkkllvTKpZSy29wVfZTPb/xVDy5/S3AxqMXFJM0y0XS+7wz3MHfOE1ye683FzMsj+gal34=@vger.kernel.org
X-Gm-Message-State: APuU4Z/6u1uk4hPqA4a8jdfer6GHVjknAOggAMm9BMQmzyX1Ti9StnUn
	Yh/rWMnzXcDx0il+8JAxKsuq6xRHUoQZWa3t6k/YwhU2q002g5WaS7aCYv8LjZcggwU=
X-Gm-Gg: AZFdTZcg7GDXHRaGu6tpno9Cd7/rXYrZMnqYDpvpfZy2E1sHR1h4KqwP7F+AsUZAcm/
	OdN6k0WYvtRaPiwHPNTIDIYBHM5BepE5WAJeYFespRVjiKEMeZq9FXvBvbYaI7IG8mYNhG20ElX
	bj3ZkgsygkSXrykzF18JLzqOX5KqiEm+HrCMMpH9Z+4pz3lhYHeqn30ILQ9oEmjN9/P5gbDAz3k
	GdCv8AlnZLDfTqstNrU1u1N+fyAbtlMZWM00xlnDP+6ww6+2EP3cjXhvNrZQtbir4wPOexnV78f
	I+gZwzqucp/g9vOnvb8o6AlYhT3/qBjgoEmLCGOkHnOW0aKJGdQUkg8nKK49UkfqLyEP86I08ag
	6BPrWK13d/D5s50Ea4/Jvem/5oPYUJ106uR5ULXFMUE3ZzIJe5uXzfr7TctRw6dScen4eLGnSFo
	tXut+zD1gq2ZKHPHRH+dQcrp/LSYTW4ImzSoeAMzXU4zPA0e6Lvgx3oM0SWpqEojqg2p+NZRzbo
	uJQqRg1QnG2CRXVIQ6itrQIyGWa78CH4F6JyZroA09d2xJSf+iw+yT3kuebUIvksShogG2J1yYt
	HSk0g77ylgOJAhyqm3/VsLMzaa5r1gjAvDMp/qDlQyK5Qn6VGjnIr83b/5PTp0daV6387XXRt8a
	Y+cNfjEqM6dZjDg009rVTPBXUnNKmMcW+d53vSxW3/TEowsS/lmQ=
X-Received: by 2002:a05:600c:64c7:b0:4bb:68c4:2044 with SMTP id 5b1f17b1804b1-4bb887fe725mr225665445e9.11.1795441929971;
        Mon, 23 Nov 2026 05:52:09 -0800 (PST)
Received: from raven.intern.cm-ag (p200300dc6f1b7800023064fffe740809.dip0.t-ipconnect.de. [2003:dc:6f1b:7800:230:64ff:fe74:809])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906817ccsm169279215e9.5.2026.11.23.05.52.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:52:09 -0800 (PST)
From: Max Kellermann <max.kellermann@ionos.com>
To: akpm@linux-foundation.org,
	kasong@tencent.com,
	qi.zheng@linux.dev,
	shakeel.butt@linux.dev,
	baohua@kernel.org,
	axelrasmussen@google.com,
	yuanchu@google.com,
	weixugc@google.com,
	baoquan.he@linux.dev,
	baolin.wang@linux.alibaba.com,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	hannes@cmpxchg.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	rcu@vger.kernel.org
Cc: Max Kellermann <max.kellermann@ionos.com>
Subject: [PATCH v4 5/5] mm/mglru: reschedule between memcg reclaim attempts
Date: Mon, 23 Nov 2026 14:52:00 +0100
Message-ID: <20261123135200.4086519-6-max.kellermann@ionos.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261123135200.4086519-1-max.kellermann@ionos.com>
References: <20261123135200.4086519-1-max.kellermann@ionos.com>
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

shrink_one() can return immediately for empty or protected memcgs, and
try_to_shrink_lruvec() can break out before reaching its
cond_resched().  A scan through many memcgs can repeatedly rotate
entries without giving other runnable tasks a scheduling opportunity.

Call cond_resched_tasks_rcu_qs() (as the existing shrink_lruvec() loop
does) after shrink_one(), while the memcg reference still pins the
cursor and before reacquiring the RCU read lock.  Also call it between
bins and nulls-marker retries, covering scans that skip every entry.

Signed-off-by: Max Kellermann <max.kellermann@ionos.com>
Reviewed-by: Barry Song <baohua@kernel.org>
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
---
 mm/vmscan.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index b9715acf2f22..f8259de7f592 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -5403,6 +5403,9 @@ static void shrink_many(struct pglist_data *pgdat, struct scan_control *sc)
 	gen = get_memcg_gen(READ_ONCE(pgdat->memcg_lru.seq));
 	bin = first_bin = get_random_u32_below(MEMCG_NR_BINS);
 restart:
+	/* Yield between bins/retries that contain only skipped entries. */
+	cond_resched_tasks_rcu_qs();
+
 	op = 0;
 	memcg = NULL;
 
@@ -5433,6 +5436,14 @@ static void shrink_many(struct pglist_data *pgdat, struct scan_control *sc)
 
 		op = shrink_one(lruvec, sc);
 
+		/*
+		 * Empty or protected memcgs can bypass the
+		 * rescheduling points in page reclaim.  The memcg
+		 * reference pins our cursor while we yield outside
+		 * the RCU read-side critical section.
+		 */
+		cond_resched_tasks_rcu_qs();
+
 		rcu_read_lock();
 
 		if (should_abort_scan(lruvec, sc))
-- 
2.53.0

