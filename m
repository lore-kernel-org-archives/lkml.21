Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795260725;
	b=ImVsrQDQiQLNyDyzUBFSpQs7wElA2b1zv/lRkSpNUmiv0ov2f9elJMitmJljO5sThwYe
	 4X719ledli5v8icipv89ehM+UThPiTOo0ujhSX4DXRfBfN9cWZtrpwvQObD8GOYFE7T6K
	 TXGRCg24SFsefgEHa6mPD9qi3gVoWY/vFDCfi8tdyPxoSbaWchiH0hhkHkVK7E6uYi8J6
	 YQr0eiacwy6HCm6DFjC0aYTDFxIGQ4+RPrpTE2CJlRHAK38epzJlhvsgLLt7ZCR+358Tf
	 Tp89S7qg5oX9sJQc7oNsq0z3eBJSEYdMCeMsbSTNF+xzS8pfoVVZd5PoepOn8XXLTpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795260725;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=NGCS/K0a+v9qdamXn5wmb9umGowNWIc4OW6YckyqxpY=;
	b=IA4KSN4Uz9rvi7wsCRtXCCr4s4Zs2nu86naTd58W+UoACHs4we6DARL/+2DobWRby4C6
	 LqGdG9lgCcC9Sa6K2ELLJtCsR4Jpn4uu1OeFG4CV25iOqR5RpfKGKxd/qTnz6DAVzEE0p
	 0DTD5a1NjqRJYrYx0XpdeQ2YjOkfKq6V49kNl68PLCt14L6DsN895gUTVGUnyHFedbWIX
	 h5BOygOIPGKgdvYSWWWRxvBvEaqJUZR3DmSwiSpbyJHCrWS75jB6ADmDCMjuYFFxbRAwT
	 PwI9BbMq6MkQo49Oq4qar0a5hE5dORk8Zz0fbx4wCikMP9CfvRD5+0skMduCQ9tra3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cG0FZdK6;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33979606A32A
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 11:32:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33979606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cG0FZdK6
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2f0414c1062so9216945ad.2
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 03:32:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795260724; x=1795865524; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NGCS/K0a+v9qdamXn5wmb9umGowNWIc4OW6YckyqxpY=;
        b=cG0FZdK6k/9BZZ/csAcJeoYIIcI9VALnU7XuyUOVDaBd1Jyft/xMXjHhByjGbqzDM0
         Vv0R4PNG53KHR+Uqk3TDv+LlSLD5wVcc7woOTHWw52ODkLVX3vQ3LMFvQ6/DqBJEx35q
         YitFw8LPBtp6x2DdxrEOTUmWeS0xLULSqYJ/SfB7UP5y0uyubwYbJconRMdL8MsWlhNI
         V4WHnlePtuFikE8bD9i7MaIZ88HbPRJpsif6TCrXe+zfDRoKwDBXAHClVTtHcTIurLXV
         01jyk0XXxvHZz4/cEbDjMdeOpv5BcKY84wkVoSvU0DYY2lzJH/nODV8WeTfhVRKkMbXY
         KZcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795260724; x=1795865524;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NGCS/K0a+v9qdamXn5wmb9umGowNWIc4OW6YckyqxpY=;
        b=nAA4HwYXKbYCBY6xwebKa2/xJ1FBPPQuUzH1iZLiGcWQs+6x/BnfuJG4dkHkEdGp1C
         2q4RDrK3bQgIhp35qa+erWjKm9igsHmiZb2MT+Dncach2/Hl+GUuVSoP2bw8lMA1gWVA
         DDQA2GYzBj/zfIHGXIvEyX5Q6R/6BM0hOpFwc+HC43n0MGjy3gtXObdXFaC1mCgAFf+J
         V0NTvPNjS1anv5YGNs8EGpatnqRuAWJiLnhM4chNe0/aGbxyjKZXyCMnyN8IcsDLnr6K
         T80idg40SYQYsHuX6TLgbVo0+lT5GtQHJH1dcRcAE/+EreVOoOCW94aYY5dPxXYJJiCZ
         u6bA==
X-Forwarded-Encrypted: i=1; AL+hErFhVN49MQwirLWdAIId9PeMgkDMedz1GwHaSA3kaHFNQ+zWxQRsJ0HG8Z2ewEC9TxpdBjgYD8g+uwGkEpc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8fVPH1MflTAjY+ZuKBY3pNOCJ5T1c9wEpEA1N9YACfhAvbQHVe
	faDJ5bcZoa8ew50RNnSPsWK33Ae+H5CNT0nrjdGpgoAK3YdhoFnoBS76
X-Gm-Gg: AZFdTZfuy26K5gnCnkIg6AT34jbYIG9ldneKAGuyKx8qRsG4PJtcne9G+4s1BsOMM4I
	gkJSMmKnzVkJbRhQu96ClCJ4cAsGyVyL04T46f9yo7rJrngQVeGXp+clYjSiXovc4qGGnM8dUmH
	HYH12f8UreqAZVtZKWS+16+Mmp6t7gWjQXTSjGfNtO69BlSe2GUnT8H0sMtxylE655N7L+ORvSB
	dm7tFDBflVTPPe2Kyrz2H1hMgokUFXZNckuQpR5rrdVQlsblUtq63nWJRHQLd3JSYa/3Lrp+IEm
	yPta0Dj+2Bha+MLaDiHVhjt1v/8okASSvAA/GLchQaJPflhIJUdTivmt9YooHPV7sjABB2rSB5e
	4LOM1gOQU5kuOkgMCyZcXUB+YTbz1hyBSoG56IfUivxbxmWnDsEL1x8ygPWPxgD9aSXsA9vyT6l
	PUOhT920Gl24FTNH99BucuBSnv+v8ujzvsokUMiXQErsUJP7ANTGBJ/rX699vcmkmro5RYypLE6
	d3D8YuBapKkWuuACwaXEsjtQS1Ozhiy8ojQLjmfjzc+wGKVaVvf5JBNuJdchXRHW64swTT8ZmKj
	UeAv9CPWsGVuHNlwE+wUPCK31ynZ9Lc6oEvV9Z2SvQ==
X-Received: by 2002:a17:902:ce85:b0:2ed:1350:59ff with SMTP id d9443c01a7336-2f03ef594c0mr58057885ad.3.1795260724508;
        Sat, 21 Nov 2026 03:32:04 -0800 (PST)
Received: from [127.0.1.1] ([220.196.193.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f04f6049dfsm16057885ad.19.2026.11.21.03.32.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 03:32:04 -0800 (PST)
From: Chaosheng Qu <chaosheng.qu.linux@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>, Gabriele Monaco <gmonaco@redhat.com>
Cc: linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] verification/rvgen: Validate the monitor type
Date: Sat, 21 Nov 2026 19:31:27 +0800
Message-ID: <cf05914335850f6835ae79b34d6b4ad891128948.1795252297.git.chaosheng.qu.linux@gmail.com>
In-Reply-To: <cover.1795252297.git.chaosheng.qu.linux@gmail.com>
References: <cover.1795252297.git.chaosheng.qu.linux@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

The monitor type is pasted into the generated monitor as RV_MON_<TYPE>.
Nothing checks it, so a typo yields a monitor that cannot build and the
tool still exits 0:

    $ rvgen monitor -c da -s test_da.dot -t bogus_type -n bm
    $ grep RV_MON_TYPE bm/bm.c
    #define RV_MON_TYPE RV_MON_BOGUS_TYPE

include/linux/rv.h defines only RV_MON_GLOBAL, RV_MON_PER_CPU,
RV_MON_PER_TASK and RV_MON_PER_OBJ, so that macro never resolves.

The accepted set is already in Monitor.monitor_types, which the help text
prints.  Pass it to argparse as choices.

Signed-off-by: Chaosheng Qu <chaosheng.qu.linux@gmail.com>
---
 tools/verification/rvgen/__main__.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/verification/rvgen/__main__.py b/tools/verification/rvgen/__main__.py
index 246b43fa2..6053db5e5 100644
--- a/tools/verification/rvgen/__main__.py
+++ b/tools/verification/rvgen/__main__.py
@@ -38,6 +38,7 @@ if __name__ == '__main__':
     monitor_parser.add_argument('-s', "--spec", dest="spec", required=True,
                                 help="Monitor specification file")
     monitor_parser.add_argument('-t', "--monitor_type", dest="monitor_type", required=True,
+                                choices=list(Monitor.monitor_types.keys()),
                                 help=f"Available options: {', '.join(Monitor.monitor_types.keys())}")
 
     container_parser = subparsers.add_parser("container", parents=[parent_parser])
-- 
2.43.0


