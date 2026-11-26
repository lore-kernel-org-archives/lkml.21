Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795728813;
	b=rkGUXIuOAPMMs4NJcWUP3qemLLd8CbOckb2cPVkeQHf4htUw2LgUZZKX3gW+P2SoWeRC
	 mQ7o5Na/5ELDRBWDXBX/bv49OoVo3SSeIKRv6g95LBpsKNh7XS8lfRKUdsjQDQB+blkwp
	 XimwuqR07k3zguDoXqfH3b9Wy29MjtX6zGE/5QAzt/UudLLTRx3jHOoutQcNz7f3vbE4B
	 atBJn3YxeZ94D+sm2tDOmT1CMTIRUeo2aatrqPGANGki+l6GwFo33ADd0Wfi9o0fv0+w5
	 G29nKKaTcakzYlEjWsgAX3EZRWh5GjTEcgeXCvmzRoUV8MdXzcyPZdJk/+b3J1OF+ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795728813;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=Vbo+pKIjO+GhRtx4yJ4Jqz9PMjuckddFrEcKv85cuAU=;
	b=trrMKcxiG4y6aSY8afDhAiOomEUIPIy1XxQHQNB4TObWdtwwHgUArxGEk3Vh9iP6Fjbq
	 aR8xuB+JHO6V/QlQYb0gsjltI37x/4KfxE0YGIr3evgztZyW9Hzadv8EILl5CeIS0Bwmm
	 DYwTb81Dwp52EHd2fNHUcUtA3qisdSf6dlHUWZzZXYEk1mUhmNiaaVB2SbEhCI1DSR83D
	 0KX35k2Irgs4cv/aogV6zuyZx5behdCekVIBWNocEM8A/EzOS4NK93ai/KfOigiVDnulL
	 2Xo88zxwZY79p178jbaXTcWVxB/AW4nq5j2eQdMTv1XmMS/nH3EVPTQebpFs2LZ2Bqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--jpiecuch.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=h19f8odj;
	arc=none smtp.remote-ip=209.85.128.70
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C2C4606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 21:33:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C2C4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jpiecuch.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=h19f8odj
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4bb680f0ac4so51934935e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 13:33:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795728811; x=1796333611; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vbo+pKIjO+GhRtx4yJ4Jqz9PMjuckddFrEcKv85cuAU=;
        b=h19f8odjK4ekjAcRMlNyOvUl182maeVmKWgaxOwX5B//VUTWBFBDqpws3+OMenUiSA
         TkSFs1ZXf5gONXqNb4ZrABH1Ac4UUclKPid+W6iTfZqTsyP2ZNdtC5OOE1Y3aA18xb/j
         oYm2wDi79pVlxCpLatxBkRh3ZGVXQBktJ+n2NSBJvyETZmxMq0T1zRofhhf/WTIVb96u
         y3EuurCqoZOQnFKUj/P90sgjCApX9V6O3zZiolFrWrjpF3Mc62LEMfttwK+RJoUA/OXo
         ZVmbDfkUZXwjaaS2dqOMgdYYyqaTTp0s9h37MKGofsSe2oM5dvXnDxMYUjFjUubWu1rV
         y/dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795728811; x=1796333611;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vbo+pKIjO+GhRtx4yJ4Jqz9PMjuckddFrEcKv85cuAU=;
        b=tEFFAmRJDwz5YDXx/tB3cqYZeguPvv48Vph0synWD/gv+Rnd9G7WAh73NXSUZ+aVLf
         iaHfqDFvLg+CbP1A92pHIvYOWkqpIqwM3iDigHnSKcZ/AFN5WyZXiHiItITlrVLbIsSM
         b5OZSsAV/c36HUaPrnzApQk9yLcq1IU2irNkObiY9nA2vihso/awKwd11vVRo+XgfVV7
         roB1jAm8SF2+WsPDFXM5Q4uP9OFvLafhq9Raz5xUb0EYk5RKshIs73otRKyJ2h5cPtob
         jPIgexL7vzGd8TAxWikUOJSvaJdOyviLc+fLpgV0QicfnL04lNLTqWrk4A9f0myinApW
         BPdg==
X-Forwarded-Encrypted: i=1; AL+hErGA+mNr1+BW4vGCzvJBmBdkU1JHTTm27XqtFA9fn0H6Ajae+cA3NIswTfQQ9dHz8y8HYZTuF7Ug/HOzel8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9hO23q/F7jZR6OYL/a0Nreww6HG66uVPUO+VQXgbQ+FhL/kamM
	OF8H3ZqEx/8zfNz3xM5+vVWG92sek3CLOfa77ooqDC/xacTpksEbopY9Hce/INMqlP23ucCFJwh
	d3Xa9h7lXz27X5Q==
X-Received: from wmjf12.prod.google.com ([2002:a7b:cd0c:0:b0:4bb:5d5c:ab85])
 (user=jpiecuch job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:e549:10b0:4bb:a60a:fc8 with SMTP id 5b1f17b1804b1-4bba60a11d2mr84875965e9.35.1795728810936;
 Thu, 26 Nov 2026 13:33:30 -0800 (PST)
Date: Thu, 26 Nov 2026 21:33:28 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261126213212.3930589-1-jpiecuch@google.com>
Subject: [PATCHSET sched_ext/for-7.4-fixes] sched_ext: Enforce SCX_CAP_BASE in
 core-sched task selection
From: Kuba Piecuch <jpiecuch@google.com>
To: Tejun Heo <tj@kernel.org>, David Vernet <void@manifault.com>, Andrea Righi <arighi@nvidia.com>, 
	Changwoo Min <changwoo@igalia.com>
Cc: Kuba Piecuch <jpiecuch@google.com>, sched-ext@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Under CONFIG_EXT_SUB_SCHED, sched_ext enforces SCX_CAP_BASE on the
dispatch path via scx_task_can_stay_on_cpu() and scx_rescuee(). However,
ext_sched_class leaves .task_is_throttled unset. Under CONFIG_SCHED_CORE,
sched_core_find() and try_steal_cookie() select tasks directly from
rq->core_tree and rely on sched_task_is_throttled() to filter ineligible
tasks before bypassing pick_task_scx(). As a result, a sub-scheduler task
sharing a core-scheduling cookie with an SMT sibling can be picked or
stolen onto a CPU where its sub-scheduler lacks SCX_CAP_BASE.

Patch 1 implements task_is_throttled_scx() under CONFIG_SCHED_CORE and
wires it to ext_sched_class.task_is_throttled.

Patch 2 adds the sub_core_caps selftest exercising a cid-form root
scheduler and child sub-scheduler on an SMT pair, verifying that a
cookie-matching sub-scheduler task is not picked on a denied sibling and
runs once SCX_CAP_BASE is granted. It requires CONFIG_SCHED_CORE=y (not
enabled by default in tools/testing/selftests/sched_ext/config) and an
SMT pair plus a third CPU. Without patch 1, the selftest fails with:

  ERR: sub_core_caps.c:534
  Sub task ran on denied CPU 1 via core-sched (run=6 deq_cse=6)

The patches were written with the help of an AI coding assistant. I have
reviewed the patches and verified the tests run by the tool.

Kuba Piecuch (2):
  sched_ext: Enforce SCX_CAP_BASE in core-sched task selection
  selftests/sched_ext: Add sub_core_caps test for core-sched
    SCX_CAP_BASE

 kernel/sched/ext/ext.c                        |  11 +
 tools/testing/selftests/sched_ext/Makefile    |   1 +
 .../selftests/sched_ext/sub_core_caps.c       | 616 ++++++++++++++++++
 .../sched_ext/sub_core_caps_root.bpf.c        |  78 +++
 .../sched_ext/sub_core_caps_sub.bpf.c         |  84 +++
 5 files changed, 790 insertions(+)
 create mode 100644 tools/testing/selftests/sched_ext/sub_core_caps.c
 create mode 100644 tools/testing/selftests/sched_ext/sub_core_caps_root.bpf.c
 create mode 100644 tools/testing/selftests/sched_ext/sub_core_caps_sub.bpf.c


base-commit: 0919f8bea37e7e354b342c2dff52dd8f5b958d6a
-- 
2.56.1.839.g22a8290db9-goog

